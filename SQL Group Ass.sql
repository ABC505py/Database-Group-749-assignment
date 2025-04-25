CREATE TABLE brand (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT
);

CREATE TABLE color (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    hex_code CHAR(7) 
);

CREATE TABLE product_category (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT
);

CREATE TABLE product (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    brand_id INT REFERENCES brand(id),
    base_price DECIMAL(10, 2) NOT NULL,
    category_id INT REFERENCES product_category(id)
);

CREATE TABLE product_image (
    id SERIAL PRIMARY KEY,
    product_id INT REFERENCES product(id),
    image_url TEXT NOT NULL,
    is_primary BOOLEAN DEFAULT FALSE
);

CREATE TABLE product_item (
    id SERIAL PRIMARY KEY,
    product_id INT REFERENCES product(id),
    sku VARCHAR(100) UNIQUE NOT NULL,
    stock_quantity INT DEFAULT 0,
    price DECIMAL(10, 2), 
    is_active BOOLEAN DEFAULT TRUE
    );
    
    CREATE TABLE product_variation (
    id SERIAL PRIMARY KEY,
    product_item_id INT REFERENCES product_item(id),
    color_id INT REFERENCES color(id),
    size_option_id INT REFERENCES size_option(id)
);

CREATE TABLE size_category (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE size_option (
    id SERIAL PRIMARY KEY,
    size_category_id INT REFERENCES size_category(id),
    value VARCHAR(50) NOT NULL
);

CREATE TABLE attribute_type (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE attribute_category (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE product_attribute (
    id SERIAL PRIMARY KEY,
    product_id INT REFERENCES product(id),
    attribute_category_id INT REFERENCES attribute_category(id),
    attribute_type_id INT REFERENCES attribute_type(id),
    name VARCHAR(100) NOT NULL,
    value TEXT NOT NULL
);

