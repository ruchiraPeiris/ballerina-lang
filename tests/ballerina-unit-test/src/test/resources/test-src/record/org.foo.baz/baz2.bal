
public type FooDepartment record {
    string dptName;
    FooPerson[] employees;
};

public type FooPerson record {
    string name = "default first name";
    string lname;
    map adrs;
    int age = 999;
    FooFamily family;
    FooPerson? parent;
};

type FooFamily record {
    string spouse;
    int noOfChildren;
    string[] children;
};

public type FooEmployee record {
    string fname;
    string lname;
    int age;
    record {
        string city;
        string state;
        string zipcode;
    } address;
    object {
        public string desc;
        public string title;
    } job;
};

public function createRecord() returns FooPerson {
    map address1;
    map address = {"country":"USA", "state":"CA"};
    FooPerson emp = {name:"Jack", adrs:address, age:25};
    return emp;
}

public function createRecordOfRecord () returns FooDepartment {

    map address = {"country":"USA", "state":"CA"};
    FooPerson emp1 = {name:"Jack", adrs:address, age:25};
    FooPerson emp2 = {};
    FooPerson[] emps = [emp1, emp2];
    FooDepartment dpt = {employees:emps};

    return dpt;
}

public function createAnonRecord() returns FooEmployee {

    FooEmployee e = {fname:"sam", lname:"json", age:100,
                     address:{city:"Los Altos", state:"CA", zipcode:"95123"}};
    return e;
}
