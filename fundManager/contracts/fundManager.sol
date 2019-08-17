pragma solidity ^0.5.1;
//using "now" validation based on time will be added in the near future

//an interface application will be provided with the mapping to each political parties and their account address

//inorder to support public miners incentive programme will be implemented in the future
//a theoretical picture will be painted now
contract fund_manager {
    uint8 public partyCount;
    mapping (address => uint) public balances;
    address public owner;
    //admin of the network
    //balances of all the parties will be made public
    
   
    
    //we'll be registering two events, amount deposited and withdrawn
    event LogDepositMade(address indexed accountAddress, uint amount);
    event LogWithdrawalPerformed(address indexed accountAddress, uint amount);
    
    //the owner must create this contract
    constructor () public payable {
        //initial funding is to supply parties with initial  credit
        //initial funding number can change based on the number of parties
        require(msg.value == 50 ether, "initial funding required");
        owner = msg.sender;
        partyCount = 0;
    }
    
    
    //only the owner can assign accounts to parties
    //return the user balance with the initial credit
    function register(address toParty) public returns (uint) {
        if (msg.sender != owner) {
            "sender not authorized";
            
        }
        balances[toParty] = 10 ether;
        partyCount++;
        return balances[msg.sender];
        
        
    }
    
    
    function deposit(uint depositAmt) public payable returns (uint) {
        balances[msg.sender] += depositAmt;
        emit LogDepositMade(msg.sender, msg.value);
        return balances[msg.sender];
    }
    
    function withdraw(uint withdrawAmt) public payable returns (uint) {
        if(withdrawAmt <= balances[msg.sender]) {
            balances[msg.sender] -= withdrawAmt;
            emit LogWithdrawalPerformed(msg.sender, withdrawAmt);
        }
        return balances[msg.sender];
    }
    
    function balance() public view returns (uint) {
        return balances[msg.sender];
    }
    
}
    
   
