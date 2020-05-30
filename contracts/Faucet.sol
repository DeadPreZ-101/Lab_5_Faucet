pragma solidity >=0.4.25 <0.7.0;

contract Faucet {

    event Withdrawal (address indexed to, uint amount);
    event Deposit (address indexed from, uint amount);

    //faucet is to give ethers for free
    function withdraw(uint withdraw_amount) public {
        // check for sufficient funds 
        require(address(this).balance >= withdraw_amount, "Faucet: Insufficient funds");
        require(withdraw_amount <= 0.1 ether, "Faucet: Max withdrawal is set to 0.1 Ether");
        msg.sender.transfer(withdraw_amount);
        emit Withdrawal (msg.sender, withdraw_amount);

    }

    function () external payable {
        emit Deposit (msg.sender, msg.value);

    }
}