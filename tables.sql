CREATE TABLE payer (
	id int(11) NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin
AUTO_INCREMENT=1;

CREATE TABLE merchant (
	id int(11) NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin
AUTO_INCREMENT=1;

CREATE TABLE sku_item (
	id int(11) NOT NULL AUTO_INCREMENT,
	utc_datetime_added timestamp() NOT NULL,
    sku varchar(255) NOT NULL,
    item_description varchar(255),
    item_quantity int(7) NOT NULL,
    item_price int(9) NOT NULL,
    
    PRIMARY KEY (id),
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin
AUTO_INCREMENT=1;

CREATE TABLE item_transaction (
	id int(11) NOT NULL AUTO_INCREMENT,
	merchant_id int(11) NOT NULL,
    payer_id int(11) NOT NULL,
    sku_item_id int(11) NOT NULL,

    FOREIGN KEY (sku_item_id)
    	REFERENCES sku_item(id),

    FOREIGN KEY (merchant_id)
		REFERENCES merchant(id),

    FOREIGN KEY (payer_id)
    	REFERENCES payer(id),
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin
AUTO_INCREMENT=1;


-- I can't tell you how long it's been since I've written pure SQL - so forgive any major syntax issues.
-- Basically I'm just creating a lookup table for items in a transaction. I don't think this scales well but would provide
-- a direct relationship between item, merchant and payer

