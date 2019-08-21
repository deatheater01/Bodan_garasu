pragma solidity ^0.5.1;

//used to count the number of voters voted 
contract validation {
    
    struct voter {
        bool voted;
        uint vote_id;
        
    }
    //admin of the network 
    address chairperson;
    
    //mapping for voter
    mapping(address => voter) voters;
    
    uint voteCount;
    event voteUpdate(uint voteCount);

    constructor() public {
        chairperson = msg.sender;
        voteCount ++;
    }
    
    function voting()  public {
        voter storage sender = voters[msg.sender];
        if(sender.voted) return;
        sender.voted = true;
        voteCount ++;
        emit voteUpdate(voteCount);
    }
    
    
}
