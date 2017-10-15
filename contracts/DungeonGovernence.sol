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
  mapping (address => uint256) public BronzeSwordInvetory;
  mapping (address => uint256) public SilverSwordInvetory;
  mapping (address => uint256) public GoldSwordInvetory;
  mapping (address => uint256) public RubySwordInvetory;

  uint public SwordPrice;

  event ItemAdded(address CharacterAddress, string ItemName, uint Amount);
  event ItemRemoved(address CharacterAddress, string ItemName, uint Amount);
  event Action(address CharacterAddress, string ActionType, uint distance);
  event Attack(address CharacterAddress, string AttackType,
    string WeaponsUsed, uint Points);

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

  /* Move */
  function MoveForward(address _user, uint _spacesMoved) {
    Action(_user, "Moved Forward", _spacesMoved);
  }

  /* Combat */
  function PlayerAttack(address _user,string _attack, 
  string _weaponUsed, uint _attackPoints) {
      Attack(_user, _attack, _weaponUsed, _attackPoints);
  }

  /* Dungeon Market */
  function SetSwordPrice(uint _price) OnlyDungeonMaster() {
    SwordPrice = _price;
  }

  function BuySword(address _character, uint _amount) {
    if (GoldCharacterBalance[_character] >= SwordPrice) {
        BronzeSwordInvetory[_character] += _amount;
        GoldCharacterBalance[_character] -= SwordPrice * _amount;
        GoldCharacterBalance[this] += SwordPrice;
        ItemAdded(_character, "Sword", _amount);
        ItemRemoved(_character, "Gold", SwordPrice);
      }
  }

  /* Forge Weapons  */
  function ForgeSilverSword(address _forger) {
    if (BronzeSwordInvetory[_forger] >= 3) {
      BronzeSwordInvetory[_forger] -= 3;
      SilverSwordInvetory[_forger] += 1;
      ItemAdded(_forger, "Silver Sword", 1);
    }
  }

  function ForgeGoldSword(address _forger) {
    if (SilverSwordInvetory[_forger] >= 3) {
      SilverSwordInvetory[_forger] -= 3;
      GoldSwordInvetory[_forger] += 1;
      ItemAdded(_forger, "Gold Sword", 1);
    }
  }

  function ForgeRubySword(address _forger) {
    if (GoldSwordInvetory[_forger] >= 3) {
      GoldSwordInvetory[_forger] -= 3;
      RubySwordInvetory[_forger] += 1;
      ItemAdded(_forger, "Ruby Sword", 1);
    }
  }
}
