<?php 
  class Post {
    // DB stuff
    private $conn;
    private $table = 'login';

    // Post Properties
    public $detailid;
    public $orderid;
    public $idproduk;
    public $password;
    public $notelp;
    public $alamat;
    public $tgljoin;
    public $role;
    public $lastlogin;

    // Constructor with DB
    public function __construct($db) {
      $this->conn = $db;
    }

    // Get Posts
    public function read() {
      // Create query
      $query = 'SELECT * FROM ' . $this->table . ' ORDER BY userid';
      
      // Prepare statement
      $stmt = $this->conn->prepare($query);

      // Execute query
      $stmt->execute();

      return $stmt;
    }

    // Get Single Post
    public function read_single() {
          // Create query
          $query = 'SELECT * FROM ' . $this->table . ' WHERE userid = ?';

          // Prepare statement
          $stmt = $this->conn->prepare($query);

          // Bind ID
          $stmt->bindParam(1, $this->userid);

          // Execute query
          $stmt->execute();

          $row = $stmt->fetch(PDO::FETCH_ASSOC);

          // Set properties
          $this->userid = $row['userid'];
          $this->namalengkap = $row['namalengkap'];
          $this->email = $row['email'];
          $this->password = $row['password'];
          $this->notelp = $row['notelp'];
          $this->alamat = $row['alamat'];
          $this->tgljoin = $row['tgljoin'];
          $this->role = $row['role'];
          $this->lastlogin = $row['lastlogin'];
    }

    // Create Post
    public function create() {
      // Create query
      $query = 'INSERT INTO ' . $this->table . ' SET Name = :name, UOM = :uom, Stock = :stock, Price = :price';

      // Prepare statement
      $stmt = $this->conn->prepare($query);

      // Clean data
      $this->userid = htmlspecialchars(strip_tags($this->userid));
      $this->namalengkap = htmlspecialchars(strip_tags($this->namalengkap));
      $this->email = htmlspecialchars(strip_tags($this->email));
      $this->password = htmlspecialchars(strip_tags($this->password));
      $this->notelp = htmlspecialchars(strip_tags($this->notelp));
      $this->alamat = htmlspecialchars(strip_tags($this->alamat));
      $this->tgljoin = htmlspecialchars(strip_tags($this->tgljoin));
      $this->role = htmlspecialchars(strip_tags($this->role));
      $this->lastlogin = htmlspecialchars(strip_tags($this->lastlogin));

      // Bind data
      $stmt->bindParam(':name', $this->name);
      $stmt->bindParam(':uom', $this->uom);
      $stmt->bindParam(':stock', $this->stock);
      $stmt->bindParam(':price', $this->price);

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
      $query = 'UPDATE ' . $this->table . ' SET Name = :name, UOM = :uom, Stock = :stock, Price = :price WHERE Id = :id';

      // Prepare statement
      $stmt = $this->conn->prepare($query);

      // Clean data
      $this->name = htmlspecialchars(strip_tags($this->name));
      $this->uom = htmlspecialchars(strip_tags($this->uom));
      $this->stock = htmlspecialchars(strip_tags($this->stock));
      $this->price = htmlspecialchars(strip_tags($this->price));
      $this->id = htmlspecialchars(strip_tags($this->id));

      // Bind data
      $stmt->bindParam(':name', $this->name);
      $stmt->bindParam(':uom', $this->uom);
      $stmt->bindParam(':stock', $this->stock);
      $stmt->bindParam(':price', $this->price);
      $stmt->bindParam(':id', $this->id);

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
      $query = 'DELETE FROM ' . $this->table . ' WHERE Id = :id';

      // Prepare statement
      $stmt = $this->conn->prepare($query);

      // Clean data
      $this->id = htmlspecialchars(strip_tags($this->id));

      // Bind data
      $stmt->bindParam(':id', $this->id);

      // Execute query
      if($stmt->execute()) {
        return true;
      }

      // Print error if something goes wrong
      printf("Error: %s.\n", $stmt->error);

      return false;
    }
  }
