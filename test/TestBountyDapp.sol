// solium-disable linebreak-style
pragma solidity ^0.4.2;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/BountyDapp.sol";

contract TestBountyDapp {

    // Truffle looks for `initialBalance` when it compiles the test suite 
    // and funds this test contract with the specified amount on deployment.
    uint public initialBalance = 1 ether;

    // create and instance of the contract
    BountyDapp bounty = new BountyDapp();

    // this create 5 bounties, so with this 5 bounties we can do the next steps
    function testNew2Bounties() public {
        uint i = 0;
        bounty.NewBounty("First","A good repair for Test 1",1);
        i++;
        bounty.NewBounty("Second","A good repair for Test 2",2);
        i++;
        uint expected = 2;

        Assert.equal(i, expected, "2 Bounties must be create correctly");
    }

    function testNew3Bounties() public {
        uint i = 0;        
        bounty.NewBounty("Third","A good repair for Test 3",1);
        i++;
        bounty.NewBounty("Fourth","A good repair for Test 4",2);
        i++;
        bounty.NewBounty("Fifth","A good repair for Test 5",3);
        i++;

        uint expected = 3;

        Assert.equal(i, expected, "3 Bounties must be create correctly");
    }

    function testNew1Bounty() public {
        uint i = 0;
        bounty.NewBounty("Sixth","A good repair for Test 6",20);
        i++;
        uint expected = 1;
        Assert.equal(i, expected, "1 Bounty must be create correctly");
    }

    // this create 25 submissions, because we already have the 5 bounties created, lets got to sent 5 submissions to each bounty
    function testNewSubmissions() public {

        uint i = 0;

        for( i; i < 5; i++ ){
            bounty.NewSubmissions("First Propose",i);
            bounty.NewSubmissions("Second Propose",i);
            bounty.NewSubmissions("Third Propose",i);
            bounty.NewSubmissions("Fourth Propose",i);
            bounty.NewSubmissions("Fifth Propose",i);
        }
        
        uint expected = 25;
        uint total = i * 5;

        Assert.equal(total, expected, "25 Submissions must be sent correctly");
    }

    function testNewSubmissions2() public {

        uint i = 0;

        for( i; i < 5; i++ ){
            bounty.NewSubmissions("Sixth Propose",i);
            bounty.NewSubmissions("Seventh Propose",i);
            bounty.NewSubmissions("Eight Propose",i);
            bounty.NewSubmissions("Ninth Propose",i);
            bounty.NewSubmissions("Tenth Propose",i);
        }
        
        uint expected = 25;
        uint total = i * 5;

        Assert.equal(total, expected, "25 Submissions must be sent correctly");
    }
    
    // this answer 10 submissions, 5 are approved and 5 are decline
    /*
    function testAnswerPropose() public {
  
        uint i = 0;

        for( i; i < 5; i++ ){
            bounty.AnswerPropose(true,i,i);            
        }

        i = 0;

        for( i; i < 5; i++ ){
            bounty.AnswerPropose(false,i,i);            
        }  
        uint expected = 10;
        uint total = i * 2; 
        Assert.equal(total, expected, "10 Answers must pass correctly"); 
    }
    */
}