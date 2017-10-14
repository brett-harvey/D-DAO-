pragma solidity ^0.4.15;

contract DungeonMaster {
  address public DM;

  function DungeonMaster() {
    DM = msg.sender;
  }

  modifier OnlyDungeonMaster() {
    require(msg.sender == DM);
    _;
  }
}

contract Dungeon is DungeonMaster {
  mapping (address => uint256) public GoldCharacterBalance;
  mapping (address => uint256) public ManaCharacterBalance;
  mapping (address => uint256) public FoodCharacterBalance;
  mapping (address => uint256) public SwordInvetory;

  uint public SwordPrice;

  event ItemAdded(address CharacterAddress, string ItemName, uint Amount);


  function Dungeon(address DungonMaster)  {
    if (DungonMaster == 0) DungonMaster = msg.sender;
    else DM = DungonMaster;
    GoldCharacterBalance[this] = 10000;
    ManaCharacterBalance[this] = 7500;
    FoodCharacterBalance[this] = 5000;
  }

  function MintGold(address _character, uint _amount) OnlyDungeonMaster {
    GoldCharacterBalance[_character] += _amount;
    ItemAdded(_character, "Gold", _amount);
  }

  function MintMana(address _character, uint _amount) OnlyDungeonMaster {
    ManaCharacterBalance[_character] += _amount;
    ItemAdded(_character, "Mana", _amount);
  }

  function MintFood(address _character, uint _amount) OnlyDungeonMaster {
    FoodCharacterBalance[_character] += _amount;
    ItemAdded(_character, "Food", _amount);
  }

  /* Dungeon Market */
  function SetSwordPrice(uint _price) OnlyDungeonMaster() {
    SwordPrice = _price;
  }

  function BuySword(address _character, uint _amount) {
    if (GoldCharacterBalance[_character] >= SwordPrice) {
        SwordInvetory[_character] += _amount;
        GoldCharacterBalance[_character] -= SwordPrice * _amount;
        GoldCharacterBalance[this] += SwordPrice;
        ItemAdded(_character, "Sword", _amount);
      }
  }
}
