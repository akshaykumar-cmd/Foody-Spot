

CREATE TABLE IF NOT EXISTS users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(150) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  role ENUM('customer','admin') NOT NULL DEFAULT 'customer',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS foods (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(120) NOT NULL,
  description VARCHAR(255) NOT NULL,
  category VARCHAR(60) NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  image_url VARCHAR(500) DEFAULT NULL,
  is_available TINYINT(1) NOT NULL DEFAULT 1
);

CREATE TABLE IF NOT EXISTS orders (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  customer_name VARCHAR(100) NOT NULL,
  phone VARCHAR(20) NOT NULL,
  address TEXT NOT NULL,
  total DECIMAL(10,2) NOT NULL,
  status ENUM('Placed','Preparing','Out for delivery','Delivered','Cancelled') NOT NULL DEFAULT 'Placed',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE IF NOT EXISTS order_items (
  id INT AUTO_INCREMENT PRIMARY KEY,
  order_id INT NOT NULL,
  food_id INT NOT NULL,
  food_name VARCHAR(120) NOT NULL,
  quantity INT NOT NULL,
  unit_price DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE,
  FOREIGN KEY (food_id) REFERENCES foods(id)
);

INSERT INTO foods (name, description, category, price, image_url) VALUES
('Classic Veg Burger','Crispy veggie patty, lettuce and house sauce','Burgers',119,'https://images.unsplash.com/photo-1520072959219-c595dc870360?w=700'),
('Paneer Burger','Spiced paneer patty with creamy sauce','Burgers',149,'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=700'),
('Margherita Pizza','Mozzarella, basil and rich tomato sauce','Pizza',199,'https://images.unsplash.com/photo-1579751626657-72bc17010498?w=700'),
('Farmhouse Pizza','Onion, capsicum, tomato and mushrooms','Pizza',249,'https://images.unsplash.com/photo-1513104890138-7c749659a591?w=700'),
('Veg Fried Rice','Wok-tossed rice with fresh vegetables','Rice',139,'https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=700'),
('Masala Dosa','Golden dosa served with chutney and sambar','South Indian',89,'https://images.unsplash.com/photo-1589301760014-d929f3979a0?w=700'),
('French Fries','Crispy salted potato fries','Sides',79,'https://images.unsplash.com/photo-1573080496219-bb080dd4f877?w=700'),
('Chocolate Brownie','Warm chocolate brownie','Desserts',99,'https://images.unsplash.com/photo-160 chocolate?w=700')
ON DUPLICATE KEY UPDATE name=VALUES(name);
