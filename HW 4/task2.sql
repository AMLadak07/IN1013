-- Insert initial data into petPet table
INSERT INTO petPet VALUES
    ("Fluffy", "Harold", "cat", "F", "1993-02-04", NULL),
    ("Claws", "Gwen", "cat", "M", "1994-03-17", NULL),
    ("Buffy", "Harold", "dog", "F", "1989-05-13", NULL),
    ("Fang", "Benny", "dog", "M", "1990-08-27", NULL),
    ("Bowser", "Diane", "dog", "M", "1979-08-31", "1995-07-29"),
    ("Chirpy", "Gwen", "bird", "F", "1998-09-11", NULL),
    ("Whistler", "Gwen", "bird", NULL, "1997-12-09", NULL),
    ("Slim", "Benny", "snake", "M", "1996-04-29", NULL),
    ('Puffball','Diane','hamster','F','1999-03-30',NULL);

-- Insert initial data into petEvent table
INSERT INTO petEvent (petname, eventdate, eventtype, remark) VALUES
    ("Fluffy", "1995-05-15", "litter", "4 kittens, 3 female, 1 male"),
    ("Buffy", "1993-06-23", "litter", "5 puppies, 2 female, 3 male"),
    ("Buffy", "1994-06-19", "litter", "3 puppies, 3 female"),
    ("Chirpy", "1999-03-21", "vet", "needed beak straightened"),
    ("Slim", "1997-08-03", "vet", "broken rib"),
    ("Slim", "1997-10-04", "vet", "broken tooth"),
    ("Bowser", "1991-10-12", "kennel", NULL),
    ("Fang", "1991-10-12", "kennel", NULL),
    ("Fang", "1998-08-28", "birthday", "Gave him a new chew toy"),
    ("Claws", "1998-03-17", "birthday", "Gave him a new flea collar"),
    ("Whistler", "1998-12-09", "birthday", "First birthday");

-- Additional updates

-- 1. Insert event for Fluffy
INSERT INTO petEvent (petname, eventdate, eventtype, remark)
VALUES ('Fluffy', '2020-10-15', 'vet', 'antibiotics');

-- 2. Insert Hammy into petPet and create an event for Hammy
INSERT INTO petPet (petname, owner, species, gender, birth, death)
VALUES ('Hammy', 'Diane', 'hamster', 'M', '2010-10-30', NULL);

INSERT INTO petEvent (petname, eventdate, eventtype, remark)
VALUES ('Hammy', '2020-10-15', 'vet', 'antibiotics');

-- 3. Update information that Fluffy had 5 kittens (2 male)
-- Add the kittens to the database
INSERT INTO petPet (petname, owner, species, gender, birth)
VALUES ('Kitten1', 'Fluffy', 'cat', 'M', '2020-10-15'),
       ('Kitten2', 'Fluffy', 'cat', 'M', '2020-10-15'),
       ('Kitten3', 'Fluffy', 'cat', 'F', '2020-10-15'),
       ('Kitten4', 'Fluffy', 'cat', 'F', '2020-10-15'),
       ('Kitten5', 'Fluffy', 'cat', 'F', '2020-10-15');

-- 4. Record that Claws broke the rib on 1997-08-03
INSERT INTO petEvent (petname, eventdate, eventtype, remark)
VALUES ('Claws', '1997-08-03', 'injury', 'broke the rib');

-- 5. Update Puffball's death information
UPDATE petPet
SET death = '2020-09-01'
WHERE petname = 'Puffball';

-- 6. Remove Harold's dog due to GDPR
DELETE FROM petPet
WHERE owner = 'Harold'
AND species = 'dog';
