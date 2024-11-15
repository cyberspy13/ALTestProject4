codeunit 50500 TestCodenit
{

    Subtype = Test;

    [Test]

    procedure CreateCustomerTest()

    var
        Cust: Record Customer;
        CustName: Text[100];

    begin

        CustName := 'John Dear';

        Cust.Init();
        Cust."No." := 'CUST001';
        Cust.Name := 'John Peel';
        Cust.Insert();


        if not Cust.Get('CUST001') then
            Error('The customer wasnt created');

        if Cust.name <> CustName then Error('Customer name does not match');

        Message('TestCreateCustomer passed successfully.');
    end;



    [Test]
    procedure TestDeleteCustomer()
    var
        Cust: Record Customer;
    begin
        // Arrange & Act
        if not Cust.Get('CUST001') then
            Error('Setup data for this test is missing.');

        // Act 
        Cust.Delete();

        // Assert 
        if Cust.Get('CUST001') then
            Error('Customer was not deleted.');

        Message('TestDeleteCustomer passed successfully.');
    end;
}






