// solium-disable linebreak-style
pragma solidity ^0.4.24;

contract BountyDapp {

    // bool for control the emergency pattern
    bool isStopped = false;

    // check if emergency stop is activated or not
    modifier stoppedInEmergency {
        require(!isStopped);
        _;
    }

    // Stop the contract in emergency case to prevent answer submissions that transfer money
    function stopContract() public {
        isStopped = true;
    }

    // Start normally the contract works
    function resumeContract() public {
        isStopped = false;
    }
 
    // Bounties Lists, here I save all the bounties created
    mapping (uint => Bounty) public Bounties;

    // Submissions Lists, here I save all submissions sent by the hunters
    mapping (uint => Submission) public Submissions;
    
    // set owner
    address owner = msg.sender;

    // Struct to define each Bounty created
    struct Bounty {
        string Title;
        string Description;
        uint Amount;
        address Poster;
        mapping (uint => address) Hunters;
    }

    // enum for define the different states that can have the submissions sents
    enum State {Pending, Approved, Decline}

    // Struct for handle each submission sent
    struct Submission {
        address Hunter;
        string Propose;
        uint Bounty;
        uint state;
    }

    // This check if the JobPoster has the money to pay
    modifier paidEnough(uint _price) { 
        require(msg.value >= _price);
        _;
    }
    
    event BountyCreated(uint _b);

    // var used to control the index of the bounties
    uint b;
    // var used to control the index of the submissions
    uint s;

    // initial constructor
    constructor() public {
        owner = msg.sender;
        b = 0;
        s = 0;
    }

    // This is the mortal design pattern that let destroy the contract and remove it from the blockchain
    function close() public {
        selfdestruct(owner);
    }

    // this lets create the bounties
    function NewBounty (string _title, string _description, uint _amount) public {
        Bounties[b] = Bounty({Title: _title, Description: _description, Amount: _amount, Poster: msg.sender});
        b = b + 1;
        emit BountyCreated(b);
    }

    // this lets create the submissions
    function NewSubmissions(string _propose, uint _b) public {
        Submissions[s] = Submission({Hunter: msg.sender,Propose: _propose,Bounty: _b, state: uint(State.Pending)});
        s = s + 1;
    }

    // this lets answer the submissions, call a modifier to check if the jobposter can pay also check is we are in normal mode or emergency
    function AnswerPropose (bool decision, uint _s, uint _b) public payable
    paidEnough(Bounties[_b].Amount) stoppedInEmergency(){
        if (decision == true) {
            // if submission was approved then pay to the hunter
            Submissions[_s].Hunter.transfer(uint(Bounties[_b].Amount));
            Submissions[_s].state = uint(State.Approved);
        } else {
            // if submission was denied the State of the submission change to Decline
            Submissions[_s].state = uint(State.Decline);
        }
    }

    /*
    function GetBounties () public returns (Bounty arr) {
        
        return (arr);
    }
    */
}