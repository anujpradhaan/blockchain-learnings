// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/*
    This Example creates a hotel room booking contract. 
    1. There can be a list of hotels who need to be registered into the system first. by the creater of the contract, we will call it the admin for the purpose of this example. 
    2. Each hotel can separately add/remove their room availability. 
        a. Obviously they can't remove a room if its already booked. 
        b. For the sake of simplicity we will consider the bookings only for a day. 
        c. Each hotel can have a ratebook for each day. 
    3. An individual can book a room in a hotel with provided money.
    4. An individual should be able to checkout. Assume the checkout has to happen the next day itself and the user will do it them selves.

    https://cryptomarketpool.com/hotel-and-vending-solidity-smart-contract/
*/

contract HotelBookingApplication{
    struct Booking{
        address bookedBy;
        string name;
        uint8 pricePaid;
    }

    struct Hotel{
        bool isRegistered;
        string name;
        uint8 roomsAvailable;
        uint8 costOfBooking;
        uint256 totalCollection;
        mapping (address => Booking) hotelBookings;
    }

    // Shoot an event once the hotel is registered

    // Shoot an event once a room is booked in a hotel

    // Shoot an event once someone checks out

    address admin;

    mapping (string => Hotel) registeredHotels;

    modifier onlyAdminCanRegister(address addressTryingToRegisterOtherAddresses){
        {
            require (admin == addressTryingToRegisterOtherAddresses, "Only an Admin can register hotels.");
            _;
        }
    }

    modifier isHotelNotRegistered(string memory name){
        {
            require(!registeredHotels[name].isRegistered, "Already registered!");
            _;
        }
    }

    constructor(){
        admin = msg.sender;
    }

    function registerHotel(string memory name, uint8 totalAvailableRooms, uint8 costOfOneRoom) public onlyAdminCanRegister(msg.sender) isHotelNotRegistered(name){  
        registeredHotels[name].name = name;
        registeredHotels[name].isRegistered = true;
        registeredHotels[name].roomsAvailable  = totalAvailableRooms;
        registeredHotels[name].costOfBooking = costOfOneRoom;
        registeredHotels[name].totalCollection = 0;
    }

    // Add modifiers to check if rooms are available.
    // Add modifier to check if user has enough balance. You might need to figure out on how to check for balance.
    //
    function bookARoom(string memory hotelName, string memory customerName, uint8 price) public{
    
    }  

    // Add modifier to see if the user can checkout!
    function checkout(string memory nameOfHotel) public{

    }
}
