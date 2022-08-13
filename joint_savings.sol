pragma solidity ^0.5.0;

// Define a new contract named `JointSavings`
contract JointSavings {

    address payable accountOne;
    address payable accountTwo;
    address public lastToWithdraw;
    uint public lastWithdrawAmount;
    uint public contractBalance;

    //Function to allow accounts to withdraw from the smart contract
    function withdraw(uint amount, address payable recipient) public {

        require(recipient == accountOne || recipient == accountTwo, "You don't own this account!");
        require(address(this).balance >= amount, "Insufficient funds!");
       
        if (lastToWithdraw != recipient) {
                lastToWithdraw = recipient;
                recipient.transfer(amount);
                lastWithdrawAmount = amount;
                contractBalance = address(this).balance;
        }
    }
    //Function to deposit
        contractBalance = address(this).balance;
    }

    
    //Function to choose which to choose which accounts will be affected.
    function setAccounts(address payable account1, address payable account2) public{
        accountOne = account1;
        accountTwo = account2;
    }

    // Fallback function
    function() external payable {}
}
