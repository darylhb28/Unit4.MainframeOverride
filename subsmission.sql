

1. Get the username of the person who made the post about EmptyStack in `forum_posts`.

    -- Query: mainframe_override=# SELECT * FROM forum_posts WHERE date BETWEEN '2048-04-01' AND '2048-04-30';
    -- Notes: The relevant post in April 2048 was made by someone with the username "smart-money-44'.

2. Get the last name of the person associated with that username in `forum_accounts`.

    -- Query: mainframe_override=# SELECT first_name, last_name FROM forum_accounts WHERE username = 'smart-money-44';
    -- Notes: The name associated with that account is 'Brad Steele'.

3. Find all other accounts with the same last name.

    -- Query: mainframe_override=# SELECT first_name, last_name FROM forum_accounts WHERE last_name = 'Steele';
    -- Notes: other accounts with that last name include :
        -- Andrew     | Steele
        -- Kevin      | Steele
        -- Brad       | Steele

4. Find all accounts in `emptystack_accounts` with the same last name.

    -- Query: mainframe_override=# SELECT * FROM emptystack_accounts WHERE last_name = 'Steele';
    -- Notes: There are two emptystack accounts with that last name:
        --  triple-cart-38 | password456 | Andrew     | Steele
        --  lance-main-11  | password789 | Lance      | Steele

5. There will only be one EmptyStack employee with a forum account. Use their credentials
   to access `node mainframe`, which will output a new `sql` file for you to run.

    -- Notes: The only EmptyStack employee with a forum account is triple-cart-38 | password456 | Andrew     | Steele
   
6. Find the message in `emptystack_messages` that mentions a project involving
   self-driving taxis. That message is sent from an admin account and also reveals
   the project code.

    --    Query: mainframe_override=# SELECT * FROM emptystack_messages WHERE subject ILIKE '%taxi%';
    --    Notes: Sent from 'your-boss-99', project code 'TAXI'

7. Get the credentials for the admin account from `emptystack_accounts`.

    -- Query: mainframe_override=# SELECT * from emptystack_accounts WHERE username = 'your-boss-99';
    -- Notes: Credentials:
        --    username   |    password    | first_name | last_name 
        -- --------------+----------------+------------+-----------
        --  your-boss-99 | notagaincarter | Skylar     | Singer

8. Get the ID of the project from `emptystack_projects`.

    -- Query: mainframe_override=# SELECT id FROM emptystack_projects WHERE code ILIKE 'taxi';
    -- Notes: Project id: 'DczE0v2b'

9. Use that information to stop the project: `node mainframe -stop`!

    -- darylhornickbecker@Daryls-MBP Unit4.MainframeOverride % node mainframe -stop
    -- WARNING: admin access required. Unauthorized access will be logged.
    -- Username: your-boss-99
    -- Password: notagaincarter
    -- Welcome, your-boss-99.
    -- Project ID: DczE0v2b
    -- Initiating project shutdown sequence...
    -- 5...
    -- 4...
    -- 3...
    -- 2...
    -- 1...
    -- Project shutdown complete.