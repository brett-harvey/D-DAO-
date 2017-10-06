pragma solidity ^0.4.15;

contract DungeonMaster {
  address public DM;

  function DungeonMaster() {
    DM = msg.sender;
  }

  modifier OnlyDungeonMaster() {
    if (msg.sender != DM) { throw; }
    _;
  }
}
