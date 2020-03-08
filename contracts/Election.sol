pragma solidity >=0.4.21 <0.7.0;

contract Election {
  mapping(bytes32 => uint) public voteCount;
  mapping(bytes32 => bool) public hasVoted;
  mapping(address => uint) public votedFrom;

  function vote(bytes32 candidateID, bytes32 voterID) public {
    require(!(hasVoted[voterID]), "You have already voted");

    voteCount[candidateID] += 1;

    hasVoted[voterID] = true;

    votedFrom[msg.sender] += 1;
  }

  function getVotes(bytes32 candidateID) public view returns(uint){
    return voteCount[candidateID];
  }
}