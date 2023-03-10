-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 
SELECT * FROM campaign

SELECT backers_count, cf_id
FROM campaign
WHERE (campaign.outcome = 'live')
ORDER BY campaign.backers_count DESC;

-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.
SELECT * FROM backers

SELECT COUNT (cf_id), cf_id
FROM backers
GROUP BY backers.cf_id
ORDER BY COUNT (backers.cf_id) DESC;


-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 
SELECT * FROM contacts

SELECT first_name, last_name, email, (campaign.goal - campaign.pledged) as Remaining_Goal_Amount
INTO email_contacts_remaining_goal_amount
FROM campaign
INNER JOIN contacts 
ON (campaign.contact_id = contacts.contact_id)
WHERE (campaign.outcome = 'live')
ORDER BY Remaining_Goal_Amount DESC;


-- Check the table
SELECT * FROM email_contacts_remaining_goal_amount

-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 
SELECT backers.email, backers.first_name, backers.last_name, campaign.cf_id, campaign.company_name, campaign.description, campaign.end_date, (campaign.goal - campaign.pledged) as left_of_goal
INTO email_backers_remaining_goal_amount
FROM campaign
INNER JOIN backers 
ON (campaign.cf_id = backers.cf_id)
WHERE (campaign.outcome = 'live')
ORDER BY backers.last_name, backers.email;


-- Check the table
SELECT * FROM email_backers_remaining_goal_amount

