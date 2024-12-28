CREATE TABLE IF NOT EXISTS titles (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    current_name VARCHAR(255) NOT NULL,
    brand ENUM('RAW','SmackDown','NXT', 'ALL') DEFAULT NULL,
    title_type ENUM('Singles', 'Tag Team') NOT NULL DEFAULT 'Singles',
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS roster (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    status ENUM('Active', 'Inactive', 'Free Agent', 'Deceased', 'Manager') NOT NULL,
    gender ENUM('Men', 'Women') NOT NULL,
    brand ENUM('RAW','SmackDown','NXT') DEFAULT NULL,
    extra VARCHAR(255) DEFAULT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS title_holders (
    id INT NOT NULL AUTO_INCREMENT,
    title_id INT NOT NULL,        
    wrestler_id INT NOT NULL,     
    PRIMARY KEY (id),
    FOREIGN KEY (title_id) REFERENCES titles(id) ON DELETE CASCADE,
    FOREIGN KEY (wrestler_id) REFERENCES roster(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS events (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    month ENUM('January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December') NOT NULL,
    year INT NOT NULL,
    season INT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS matches (
    id INT NOT NULL AUTO_INCREMENT,
    event_id INT NOT NULL,                       
    match_type VARCHAR(255) NOT NULL,            
    special_stipulation VARCHAR(255) DEFAULT NULL, -- #1 Contender Matches, Title vs. Career, etc.
    championship_match BOOLEAN DEFAULT FALSE,
    match_description TEXT NOT NULL,           
    result_type ENUM('Victory', 'DQ Victory', 'No Contest', 'Draw', 'Other') DEFAULT NULL,
    notes TEXT DEFAULT NULL,                     -- Optional notes field for storyline details
    is_main_event BOOLEAN DEFAULT FALSE,
    is_pre_show BOOLEAN DEFAULT FALSE, 
    PRIMARY KEY (id),
    FOREIGN KEY (event_id) REFERENCES events(id) ON DELETE CASCADE  -- Links match to an event
);

CREATE TABLE IF NOT EXISTS match_participants (
    id INT NOT NULL AUTO_INCREMENT,
    match_id INT NOT NULL,                      
    wrestler_id INT NOT NULL,                   
    is_competitor BOOLEAN NOT NULL DEFAULT TRUE, -- FALSE if they are a manager/valet/referee
    accompanied_by INT DEFAULT NULL,            -- The manager/valet for the wrestler
    team_number INT DEFAULT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (match_id) REFERENCES matches(id) ON DELETE CASCADE, 
    FOREIGN KEY (wrestler_id) REFERENCES roster(id) ON DELETE CASCADE,
    FOREIGN KEY (accompanied_by) REFERENCES roster(id) ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS match_winners (
    id INT NOT NULL AUTO_INCREMENT,
    match_id INT NOT NULL,                       
    wrestler_id INT DEFAULT NULL,                    
    PRIMARY KEY (id),
    FOREIGN KEY (match_id) REFERENCES matches(id) ON DELETE CASCADE, 
    FOREIGN KEY (wrestler_id) REFERENCES roster(id) ON DELETE CASCADE  
);

CREATE TABLE IF NOT EXISTS match_titles (
    id INT NOT NULL AUTO_INCREMENT,
    match_id INT NOT NULL,                      
    title_id INT NOT NULL,                      
    title_changed BOOLEAN DEFAULT FALSE, 
    PRIMARY KEY (id),
    FOREIGN KEY (match_id) REFERENCES matches(id) ON DELETE CASCADE, 
    FOREIGN KEY (title_id) REFERENCES titles(id) ON DELETE CASCADE   
);

CREATE TABLE IF NOT EXISTS title_history (
    id INT NOT NULL AUTO_INCREMENT,
    title_id INT NOT NULL,                      
    champion_id INT NOT NULL,                   
    defeated_id INT NOT NULL,               
    match_id INT NOT NULL,                    
    reign_duration INT DEFAULT NULL,                 
    PRIMARY KEY (id),
    FOREIGN KEY (title_id) REFERENCES titles(id) ON DELETE CASCADE,
    FOREIGN KEY (champion_id) REFERENCES roster(id) ON DELETE CASCADE,
    FOREIGN KEY (defeated_id) REFERENCES roster(id) ON DELETE CASCADE,
    FOREIGN KEY (match_id) REFERENCES matches(id) ON DELETE CASCADE
);

