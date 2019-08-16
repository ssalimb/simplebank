pragma solidity >=0.4.22 <0.6.0;

contract SimpleBank {
    
    mapping (address => uint256) private balances; 
    address public owner; 
    event LogDepositMade(address accountAddress, uint256 amount); 
    
    /// @dev Use constructor to initialize address of owner 
    /// who deploys the smart contract.
    constructor() public { 
        owner = msg.sender; 
    } 
    
    function deposit() public payable returns (uint256) { 
        require((balances[msg.sender] + msg.value) >= balances[msg.sender]); 
        /// @notice This is highly prone to error, use safemath to 
        /// perform mathematical calculations
        /// @notice To avoid overflow && underflow problems
        /// Import SafeMath from open-zeppelin
        balances[msg.sender] += msg.value; 
        return balances[msg.sender]; 
    } 
    
    function withdraw(uint256 withdrawAmount) public returns (uint256 remainingBal) { 
        require(withdrawAmount <= balances[msg.sender]); 
        /// @dev Refer above to perform calculations. Don't use
        /// normal calculations.
        balances[msg.sender] -= withdrawAmount; 
        msg.sender.transfer(withdrawAmount); 
        return balances[msg.sender]; 
    } 
    
    /// @notice This function isn't required
    /// Use Solidity Global variables or
    /// web3.js provides this balance lookup feature
    /// Above mentioned is optional though, below function is not wrong though
    function balance() view public returns (uint) { 
        return balances[msg.sender]; 
    }
}
