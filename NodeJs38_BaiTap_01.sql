
-- TẠO BẢNG___________________________________________________________

CREATE TABLE users (
	user_id INT PRIMARY KEY AUTO_INCREMENT,
	full_name VARCHAR(50),
	email VARCHAR(50),
	pass_word VARCHAR(50)
);

CREATE TABLE restaurant (
	res_id INT PRIMARY KEY AUTO_INCREMENT,
	res_name VARCHAR(50),
	image VARCHAR(255),
	descrip VARCHAR(255)
);

CREATE TABLE food_type (
	type_id INT PRIMARY KEY AUTO_INCREMENT,
	type_name VARCHAR(100)
);

CREATE TABLE food (
	food_id INT PRIMARY KEY AUTO_INCREMENT,
	food_name VARCHAR(100),
	image VARCHAR(255),
	price FLOAT,
	descrip VARCHAR(255),
	type_id INT, -- Khoá phụ
	FOREIGN KEY (type_id) REFERENCES food_type(type_id)
);

CREATE TABLE rate_res (
	user_id INT, -- Khoá phụ
	res_id INT, -- Khoá phụ
	amount INT,
	date_rate DATE,
	FOREIGN KEY (user_id) REFERENCES users(user_id),
	FOREIGN KEY (res_id) REFERENCES restaurant(res_id)
);

CREATE TABLE like_res (
	user_id INT, -- Khoá phụ
	res_id INT, -- Khoá phụ
	date_like DATE,
	FOREIGN KEY (user_id) REFERENCES users(user_id),
	FOREIGN KEY (res_id) REFERENCES restaurant(res_id)
);

CREATE TABLE orders (
	user_id INT, -- Khoá phụ
	food_id INT, -- Khoá phụ
	amount INT,
	order_code VARCHAR(50),
	arr_sub_id VARCHAR(50),
	FOREIGN KEY (user_id) REFERENCES users(user_id),
	FOREIGN KEY (food_id) REFERENCES food(food_id)
);

CREATE TABLE sub_food (
	sub_id INT PRIMARY KEY AUTO_INCREMENT,
	sub_name VARCHAR(100),
	sub_price FLOAT,
	food_id INT, -- Khoá phụ 
	FOREIGN KEY (food_id) REFERENCES food(food_id)
);



-- ĐIỀN DỮ LIỆU___________________________________________________________

INSERT INTO users (full_name, email, pass_word)
VALUES
    ('John Doe', 'john.doe@email.com', 'password1'),
    ('Jane Smith', 'jane.smith@email.com', 'password2'),
    ('Bob Johnson', 'bob.johnson@email.com', 'password3'),
    ('Alice Brown', 'alice.brown@email.com', 'password4'),
    ('Charlie Davis', 'charlie.davis@email.com', 'password5'),
    ('Eva White', 'eva.white@email.com', 'password6'),
    ('David Lee', 'david.lee@email.com', 'password7'),
    ('Grace Miller', 'grace.miller@email.com', 'password8'),
    ('Frank Wilson', 'frank.wilson@email.com', 'password9'),
    ('Helen Moore', 'helen.moore@email.com', 'password10'),
    ('George Taylor', 'george.taylor@email.com', 'password11'),
    ('Ivy Robinson', 'ivy.robinson@email.com', 'password12'),
    ('Jack Harris', 'jack.harris@email.com', 'password13'),
    ('Katherine Clark', 'katherine.clark@email.com', 'password14'),
    ('Liam Turner', 'liam.turner@email.com', 'password15');

INSERT INTO restaurant (res_name, image, descrip)
VALUES
    ('Pho 2000', 'pho_2000.jpg', 'Famous for delicious pho noodle soup'),
    ('Nha Hang Ngon', 'nha_hang_ngon.jpg', 'A popular spot for Vietnamese street food'),
    ('The Deck Saigon', 'the_deck_saigon.jpg', 'Riverside restaurant with a serene atmosphere'),
    ('Ngo 8', 'lusine_leloi.jpg', 'Chic French-inspired cafe and restaurant');


INSERT INTO food_type (type_name) VALUES
    ('Savory Delights'),
    ('Sweet Indulgences'),
    ('Spicy Adventures'),
    ('Comfort Classics');

INSERT INTO food (food_name, image, price, descrip, type_id)
VALUES
    ('Dragon Fire Ramen', 'dragon_fire_ramen.jpg', 10.99, 'Spicy ramen with dragon breath broth', 1),
    ('Chocolate Explosion Cake', 'chocolate_explosion_cake.jpg', 12.99, 'Rich chocolate cake with molten lava center', 2),
    ('Sizzling Sriracha Wings', 'sizzling_sriracha_wings.jpg', 8.99, 'Crispy chicken wings coated in tangy Sriracha sauce', 3),
    ('Gourmet Truffle Burger', 'gourmet_truffle_burger.jpg', 15.99, 'Juicy beef burger with truffle-infused toppings', 4),
    ('Mystical Unicorn Sundae', 'mystical_unicorn_sundae.jpg', 7.99, 'Colorful ice cream sundae with edible unicorn horn', 1),
    ('Spaghetti Carbonara Tower', 'spaghetti_carbonara_tower.jpg', 11.99, 'Twisted spaghetti tower with creamy carbonara sauce', 2),
    ('Enchanted Forest Salad', 'enchanted_forest_salad.jpg', 9.99, 'Fresh salad with mystical greens from the enchanted forest', 3),
    ('Phantom Pepperoni Pizza', 'phantom_pepperoni_pizza.jpg', 14.99, 'Classic pepperoni pizza with a ghostly twist', 4),
    ('Galactic Galaxy Donut', 'galactic_galaxy_donut.jpg', 18.99, 'Glazed donut adorned with edible galaxy-inspired decorations', 1),
    ('Mango Tango Sushi Roll', 'mango_tango_sushi_roll.jpg', 16.99, 'Sushi roll with a tropical mango twist', 2),
    ('Fire-breathing Dragon Curry', 'fire_breathing_dragon_curry.jpg', 13.99, 'Spicy curry that packs a fiery punch', 3),
    ('Heavenly Cloud Soufflé', 'heavenly_cloud_souffle.jpg', 10.99, 'Light and airy soufflé with a touch of heavenly sweetness', 4),
    ('Whimsical Watermelon Salad', 'whimsical_watermelon_salad.jpg', 11.99, 'Refreshing salad featuring whimsical watermelon shapes', 1),
    ('Black Magic Chocolate Truffles', 'black_magic_chocolate_truffles.jpg', 14.99, 'Decadent chocolate truffles with a touch of black magic', 2),
    ('Cauldron Brewed Potion', 'cauldron_brewed_potion.jpg', 16.99, 'Magical potion brewed in a bubbling cauldron', 3),
    ('Rainbow Unicorn Cupcake', 'rainbow_unicorn_cupcake.jpg', 9.99, 'Cupcake adorned with rainbow-colored unicorn mane', 4),
    ('Panda Bamboo Shoot Dumplings', 'panda_bamboo_shoot_dumplings.jpg', 12.99, 'Adorable panda-shaped dumplings filled with bamboo shoots', 1),
    ('Extraterrestrial Ice Cream Cone', 'extraterrestrial_ice_cream_cone.jpg', 15.99, 'Ice cream cone featuring flavors from another galaxy', 2);

INSERT INTO rate_res (user_id, res_id, amount, date_rate)
VALUES
    (1, 1, 4, '2023-01-01'),
    (2, 1, 5, '2023-01-02'),
    (3, 1, 3, '2023-01-03'),
    (4, 1, 4, '2023-01-04'),
    (5, 3, 5, '2023-01-05'),
    (6, 3, 4, '2023-01-06'),
    (7, 4, 3, '2023-01-07'),
    (8, 4, 5, '2023-01-08'),
    (10, 1, 3, '2023-01-09'),
    (12, 2, 4, '2023-01-10'),
    (13, 3, 5, '2023-01-11'),
    (15, 3, 3, '2023-01-12');

INSERT INTO like_res (user_id, res_id, date_like)
VALUES
    (1, 1, '2023-01-01'),
    (2, 1, '2023-01-02'),
    (3, 1, '2023-01-03'),
    (4, 1, '2023-01-04'),
    (5, 3, '2023-01-05'),
    (6, 3, '2023-01-06'),
    (7, 4, '2023-01-07'),
    (8, 4, '2023-01-08'),
    (9, 1, '2023-01-09'),
    (10, 2, '2023-01-10'),
    (11, 3, '2023-01-11'),
    (12, 1, '2023-01-12'),
    (1, 3, '2023-01-13'),
    (2, 3, '2023-01-14'),
    (3, 4, '2023-01-15'),
    (4, 1, '2023-01-16'),
    (5, 3, '2023-01-17'),
    (6, 3, '2023-01-18'),
    (7, 4, '2023-01-19'),
    (8, 1, '2023-01-20');

INSERT INTO orders (user_id, food_id, amount, order_code, arr_sub_id)
VALUES
    (1, 1, 2, 'ORDER123', 'SUB123'),
    (2, 3, 1, 'ORDER124', 'SUB124'),
    (3, 5, 3, 'ORDER125', 'SUB125'),
    (4, 8, 2, 'ORDER126', 'SUB126'),
    (5, 8, 1, 'ORDER127', 'SUB127'),
    (6, 11, 4, 'ORDER128', 'SUB128'),
    (7, 11, 2, 'ORDER129', 'SUB129'),
    (8, 17, 3, 'ORDER130', 'SUB130'),
    (9, 18, 1, 'ORDER131', 'SUB131'),
    (10, 2, 3, 'ORDER132', 'SUB132'),
    (11, 3, 2, 'ORDER133', 'SUB133'),
    (12, 4, 1, 'ORDER134', 'SUB134'),
    (1, 15, 4, 'ORDER135', 'SUB135'),
    (2, 15, 2, 'ORDER136', 'SUB136'),
    (3, 4, 3, 'ORDER137', 'SUB137'),
    (4, 1, 1, 'ORDER138', 'SUB138'),
    (5, 12, 3, 'ORDER139', 'SUB139'),
    (6, 3, 2, 'ORDER140', 'SUB140'),
    (7, 4, 1, 'ORDER141', 'SUB141'),
    (8, 1, 2, 'ORDER142', 'SUB142'),
    (9, 2, 3, 'ORDER143', 'SUB143'),
    (10, 3, 1, 'ORDER144', 'SUB144'),
    (11, 14, 4, 'ORDER145', 'SUB145'),
    (12, 1, 2, 'ORDER146', 'SUB146'),
    (1, 3, 3, 'ORDER147', 'SUB147'),
    (2, 4, 1, 'ORDER148', 'SUB148'),
    (3, 1, 2, 'ORDER149', 'SUB149'),
    (4, 2, 4, 'ORDER150', 'SUB150');

INSERT INTO sub_food (sub_name, sub_price, food_id)
VALUES
    ('Extra Avocado', 1.5, 1),
    ('Spicy Mayo Drizzle', 0.75, 1),
    ('Garlic Butter Sauce', 1.0, 2),
    ('Extra Cheese', 2.0, 2),
    ('Protein Booster', 3.0, 3),
    ('Vitamin C Blast', 2.5, 3),
    ('Double Chocolate Drizzle', 1.25, 4),
    ('Caramel Swirl', 1.0, 4),
    ('Extra Spicy Kick', 1.0, 5),
    ('Teriyaki Glaze', 1.5, 5),
    ('Fresh Basil Topping', 0.5, 6),
    ('Sesame Seed Sprinkle', 0.75, 6),
    ('Mixed Berries', 1.5, 7),
    ('Honey Yogurt Drizzle', 1.0, 7),
    ('Crispy Onion Strings', 1.25, 8),
    ('Garlic Aioli Dip', 1.0, 8),
    ('Balsamic Reduction', 1.5, 9);

-- TRẢ LỜI CÂU HỎI________________________________________________________

-- 1) Tìm 5 người đã like nhà hàng nhiều nhất
SELECT u.user_id, u.full_name, COUNT(*) AS like_count
FROM like_res lr
JOIN users u ON lr.user_id = u.user_id
GROUP BY u.user_id
ORDER BY like_count DESC
LIMIT 5;

-- 2) Tìm 2 nhà hàng có lượt like nhiều nhất
SELECT lr.res_id, r.res_name, COUNT(*) AS like_count
FROM like_res lr
JOIN restaurant r ON r.res_id = lr.res_id
GROUP BY r.res_id
ORDER BY like_count DESC
LIMIT 2;

-- 3) Tìm người đã đặt hàng nhiều nhất
SELECT u.user_id, u.full_name, COUNT(*) AS order_count
FROM orders o
JOIN users u on o.user_id = u.user_id
GROUP BY o.user_id
ORDER BY order_count DESC
LIMIT 1;

-- 4) Tìm người dùng không hoạt động trong hệ thống (không đặt hàng, không like, không đánh giá nhà hàng)
SELECT u.user_id, u.full_name
FROM users u
LEFT JOIN orders o ON u.user_id = o.user_id
LEFT JOIN like_res lr ON u.user_id = lr.user_id
LEFT JOIN rate_res rr ON u.user_id = rr.user_id
WHERE o.user_id IS NULL AND lr.user_id IS NULL AND rr.user_id IS NULL;

