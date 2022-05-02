// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.13;

//This contract takes data to build two structures from a storybook android app
//you read them back it was designed to avoid too many transactions.
//At one point was able to read/write to the Android smartphone but that was when I was 
//working with two separate structures. Once I nested them I ran into issues with the test contract class.
//Aparently when testing it seem to not allow uint to be created. I looked around and seemed as if you wanted to use
//an array fixed or dynamic and pass it to the contract you could run into issues in the test contract code.
//But when connected to the java android app everythin was fine. You just had to be careful about changes
//after running the first time due to CRUD being Create and Read. Still a bit of work such as finishing the structures
//and adding more test code to get better coverage. Fun challenge and I will work more on it to keep in tune with blockchain
contract AdventureConfig {

   struct Adventure { 
      string name;
       string description;
      string author;
      uint[] adventureStepIds;
      uint adventure_id;
   }

   struct AdventureStep {
      string name;
      string description;
      uint stepType;

   }

   mapping(address => Adventure[]) private adventures;
   mapping(address => mapping(uint => AdventureStep)) private adventuresteps;

    //mapping(uint => Adventure) adventureStructs; // random access by adventure key
   // bytes32[] adventureList; // list of adventure keys so we can enumerate them

   constructor() {
      
   }
   
   function addAdventure(string memory name, string memory desc, string memory author, uint id, uint[] calldata adventureStepIds) public {
   
      adventures[msg.sender].push(Adventure(name,desc,author,adventureStepIds,id));
   }
   function getAdventure(uint _index) public view returns (Adventure memory) {
      return adventures[msg.sender][_index];
   }
    function getAdventureCount() public view returns (uint) {
      return adventures[msg.sender].length;
   }


   function addAdventureSteptoAdventure(uint stepId, AdventureStep memory adventureStep, uint[] memory adventureIds) public {
        
        for(uint i = 0; i < adventureIds.length; i++) {
            adventuresteps[msg.sender][stepId] = AdventureStep(adventureStep.name, adventureStep.description,adventureStep.stepType);
        }
    
   }
   function getAdventureStep(uint stepId) public view returns (AdventureStep memory) {
      return adventuresteps[msg.sender][stepId];
   }
    function getAdventureStepCountForAdventure(uint key) public view returns (uint) {
      return adventures[msg.sender][key].adventureStepIds.length;
   }


}