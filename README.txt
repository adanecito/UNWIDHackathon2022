//-------------------------contract design comments
//This contract takes data to build two structures from a storybook android app
//you read them back it was designed to avoid too many transactions.
//At one point was able to read/write to the Android smartphone but that was when I was 
//working with two separate structures. Once I nested them I ran into issues with the test contract class.
//Aparently when testing it seem to not allow uint to be created. I looked around and seemed as if you wanted to use
//an array fixed or dynamic and pass it to the contract you could run into issues in the test contract code.
//But when connected to the java android app everythin was fine. You just had to be careful about changes
//after running the first time due to CRUD being Create and Read. Still a bit of work such as finishing the structures
//and adding more test code to get better coverage. Fun challenge and I will work more on it to keep in tune with blockchain

//-------------------------test code comments
//Ran into an interesting issue near the end where I needed an array of ids to pass into the contract
//I instanciated it but for some reason that is not allowed. I looked at other test code and sure enough
//no body was passing in aguments as seperate varibles but instead setting them as they created instances. I looked
//at different examples and saw the same thing. I will work more on it after the hackathon to keep fresh on blockchain.
//great exercise. I setup my dev environment on windoows and ubuntu on my laptop. Learning curve was steep but
//i got everthing working from front (android) to back or geth running on ubuntu.


//------------------------Environment comments
//I already had a android studio environment and decided to create a ubuntu environment wusing windows subsystem for linux or WSL as it is often
//refered to. Another interesting learning curve. I had to learn alot more about my network and setting up all the tools needed on ubuntu like web3j and solcs
//even had to disable some security or macafee to allow my smartphone to reach geth port on wsl on my local network. Once I was able to connect to my smartphone
//andriod app I was happy.

Anyway I am sure the reader understands. :-)