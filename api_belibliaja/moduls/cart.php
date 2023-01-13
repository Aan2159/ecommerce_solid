<?php 
  class Post {
    // DB stuff
    private $conn;
    private $table = 'cart';

    // Post Properties
    public $idcart;
    public $orderid;
    public $userid;
    public $tglorder;
    public $status;


    // Constructor with DB
    public function __construct($db) {
      $this->conn = $db;
    }

    // Get Posts
    public function read() {
      // Create query
      $query = 'SELECT * FROM ' . $this->table . ' ORDER BY idcart';
      
      // Prepare statement
      $stmt = $this->conn->prepare($query);

      // Execute query
      $stmt->execute();

      return $stmt;
    }

    // Get Single Post
    public function read_single() {
          // Create query
          $query = 'SELECT * FROM ' . $this->table . ' WHERE idcart = ?';

          // Prepare statement
          $stmt = $this->conn->prepare($query);

          // Bind ID
          $stmt->bindParam(1, $this->userid);

          // Execute query
          $stmt->execute();

          $row = $stmt->fetch(PDO::FETCH_ASSOC);

          // Set properties
          $this->idcart = $row['idcart'];
          $this->orderid = $row['orderid'];
          $this->userid = $row['userid'];
          $this->tglorder = $row['tglorder'];
          $this->status = $row['status'];
        
    }

    // Create Post
    public function create() {
      // Create query
      $query = 'INSERT INTO ' . $this->table . ' SET idcart = :idcart, orderid = :orderid, userid =userid:, tglorder = :tglorder, status = :status';

      // Prepare statement
      $stmt = $this->conn->prepare($query);

      // Clean data
      $this->idcart = htmlspecialchars(strip_tags($this->idcart));
      $this->orderid = htmlspecialchars(strip_tags($this->orderid));
      $this->userid = htmlspecialchars(strip_tags($this->userid));
      $this->tglorder = htmlspecialchars(strip_tags($this->tglorder));
      $this->status = htmlspecialchars(strip_tags($this->status));
      
      // Bind data
      $stmt->bindParam(':idcart', $this->idcart);
      $stmt->bindParam(':orderid', $this->orderid);
      $stmt->bindParam(':userid', $this->userid);
      $stmt->bindParam(':tglorder', $this->tglorder);
      $stmt->bindParam(':status', $this->status);
      // Execute query
      if($stmt->execute()) {
        return true;
      }

      // Print error if something goes wrong
      printf("Error: %s.\n", $stmt->error);

      return false;
    }

    // Update Post
    public function update() {
      // Create query
      $query = 'UPDATE ' . $this->table . ' SET orderid = :orderid, userid = :userid, tglorder = :tglorder, status = :status WHERE idcart = :idcart';

      // Prepare statement
      $stmt = $this->conn->prepare($query);

       // Clean data
       $this->idcart = htmlspecialchars(strip_tags($this->idcart));
       $this->orderid = htmlspecialchars(strip_tags($this->orderid));
       $this->userid = htmlspecialchars(strip_tags($this->userid));
       $this->tglorder = htmlspecialchars(strip_tags($this->tglorder));
       $this->status = htmlspecialchars(strip_tags($this->status));
       

      // Bind data
      $stmt->bindParam(':idcart', $this->idcart);
      $stmt->bindParam(':orderid', $this->orderid);
      $stmt->bindParam(':userid', $this->userid);
      $stmt->bindParam(':tglorder', $this->tglorder);
      $stmt->bindParam(':status', $this->status);
      // Execute query
      if($stmt->execute()) {
        return true;
      }

      // Print error if something goes wrong
      printf("Error: %s.\n", $stmt->error);

      return false;
    }

    // Delete Post
    public function delete() {
      // Create query
      $query = 'DELETE FROM ' . $this->table . ' WHERE idcart = idcart:';

      // Prepare statement
      $stmt = $this->conn->prepare($query);

      // Clean data
      $this->idcart = htmlspecialchars(strip_tags($this->idcart));

      // Bind data
      $stmt->bindParam(':idcart', $this->idcart);

      // Execute query
      if($stmt->execute()) {
        return true;
      }

      // Print error if something goes wrong
      printf("Error: %s.\n", $stmt->error);

      return false;
    }
  }
