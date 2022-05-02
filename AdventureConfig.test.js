const AdventureConfig = artifacts.require("AdventureConfig");

//Ran into an interesting issue at the end where I needed an array of ids to pass into the contract
//I instanciated it but for some reason that is not allowed. I looked at other test code and sure enough
//no body was passing in aguments as seperate varibles but instead setting them as they created instances. I looked
//at different examples and saw the same thing. I will work more on it after the hackathon to keep fresh on blockchain.
//great exercise. I setup my dev environment on windoows and ubuntu on my laptop. Learning curve was steep but
//i got everthing working from front (android) to back or geth running on ubuntu.
contract("AdventureConfig", (accounts) => {
  
    before(async () => {
        instance = await AdventureConfig.deployed();
        
    })

    it(' ensures that the initial adventure has been added', async () => {
    
        let ids = uint[3];
        ids[0] =0;
        ids[1] =1;
        ids[2] =2;
        await instance.addAdventure('California Earthquakes','yeah','Tony',1,ids) 
        
        count = await instance.getAdventureCount()
        assert.equal(count,1,'The initial count should be 1')
        //assert.equal(myadventure.name,'California Earthquakes','The initial name should be ')
    
    })
    
    it(' ensures that a new adventure has been added', async () => {
        let ids = uint[3];
        ids[0] =0;
        ids[1] =1;
        ids[2] =2;
        await instance.addAdventure('California Wildfires','yeah','Tony',1,ids) 
    
            count = await instance.getAdventureCount()
            assert.equal(count,1,'The initial count should be 1')
            //assert.equal(myadventure.name,'California Earthquakes','The initial name should be ')
    
    })
        it(' ensures that the initial name value has been set', async () => {
            let myname = await instance.getAdventureName(0)
            assert.equal(myname,'Idaho Wildfire','The initial name should be California Earthquakes')
        })
  
    
       // it(' ensures that the id has been set', async () => {
       //     let id = await instance.getAdventureId('test5')
       //     assert.equal(id,1,'The id should be one')
       // })

})