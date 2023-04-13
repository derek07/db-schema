CREATE TABLE Users (
    User_ID INT PRIMARY KEY,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Email VARCHAR(100),
    Password VARCHAR(50),
    Phone_Number VARCHAR(20),
    Address VARCHAR(200)
    Role VARCHAR(50)
);

CREATE TABLE Restaurants (
    Restaurant_ID INT PRIMARY KEY,
    Owner_ID INT,
    Restaurant_Name VARCHAR(100),
    Address VARCHAR(200),
    Phone_Number VARCHAR(20),
    Delivery_Time VARCHAR(50),
    Average_Rating DECIMAL(3,2)
    FOREIGN KEY (Owner_ID) REFERENCES Users(User_ID)
);

CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Customer_ID INT,
    Restaurant_ID INT,
    Order_Date DATE,
    Delivery_Address VARCHAR(200),
    Total_Price DECIMAL(8,2),
    Order_Status VARCHAR(20),
    FOREIGN KEY (Customer_ID) REFERENCES Users(User_ID),
    FOREIGN KEY (Restaurant_ID) REFERENCES Restaurants(Restaurant_ID)
);

CREATE TABLE Order_Items (
    Order_Item_ID INT PRIMARY KEY,
    Order_ID INT,
    Item_ID INT,
    Quantity INT,
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID),
    FOREIGN KEY (Item_ID) REFERENCES Menu_Items(Item_ID)
);

CREATE TABLE Feedback (
    Feedback_ID INT PRIMARY KEY,
    Comment VARCHAR(500),
    Review_Date DATE,
    Customer_ID INT,
    Restaurant_ID INT,
    FOREIGN KEY (Customer_ID) REFERENCES Users(User_ID),
    FOREIGN KEY (Restaurant_ID) REFERENCES Restaurants(Restaurant_ID)
);

CREATE TABLE Payment (
    Payment_ID INT PRIMARY KEY,
    Order_ID INT,
    Payment_Type VARCHAR(50),
    Payment_Status VARCHAR(50),
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID),
);


