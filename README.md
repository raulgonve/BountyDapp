BountyDapp

Description: Create a bounty dApp where people can post or submit work.

User Stories:
As a job poster, I can create a new bounty. I will set a bounty description and include the amount to be paid for a successful submission. I am able to view a list of bounties that I have already posted. By clicking on a bounty, I can review submissions that have been proposed. I can accept or reject the submitted work. Accepting proposed work will pay the submitter the deposited amount.
 
As a bounty hunter, I can submit work to a bounty for review.


- What does your project do?
	The BountyDapp basically is an Dapp that does 3 things:
	1.- Create New Bounties (Job Posters)
	2.- Create New Submissions (Hunters)
	3.- Accept or Reject Submissions (Job Posters)
		3.1.- If accept, pay to the hunter
		3.2.- If Reject the submission don't pay

- How to set it up
	
	1.- Unzip the file
	2.- Using Truffle in the console
	3.- Run Ganache with port 8545 or truffle develop in the same port
	4.- Compile the project (truffle compile)
	5.- Migrate the project (truffle migrate)
	6.- Run the tests (truffle test)
	7.- For use the IU
		7.1.- Type in the console npm run dev
		7.2.- Open Browser in localhost:8080
		7.3.- Log like a Job Poster (user: user1, pass: 1234) 
		7.4.- Log like a Hunter (user: user2, pass: 1234)