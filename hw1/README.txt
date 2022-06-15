Dental Practice:

BUSSINESS_ID - PK
NAME - bussiness name
ADDRESS
PHONE_NUMBER
EXPIRE_DATE - list of expiration dates got from license
EXPIRE_ALERT - send an alert to professionals 60 days before the expiration date
TOTAL_STARTUP_COST

Staff:
// depend on company, weak entity

BUSSINESS_ID - PK
STAFF_ID - PK
LAST_NAME
FIRST_NAME
STAFF_TYPE - front office workers, dental hygienists, regular dentists, periodontists, endodontists, orthodontists and dental surgeons
ADDRESS
ZIP_CODE
PHONE_NUMBER
PROVIDER_NAME - staff needs to maintain a list of insurance providers
SALARY - FK - salary for monthly payment
PATIENT_ID

License:
// depend on doctor, weak entity

LICENSE_ID - PK
RENEWAL_METHOD - mail or on line
START_DATE - start date of the license
EXPIRE_DATE - expiration date of the license
FEES - fee required for renewing the license

Doctor:

DOCTOR_ID - PK, FK for license
LAST_NAME
FIRST_NAME
ADDRESS
ZIP_CODE
PHONE_NUMBER
EXPIRE_ALERT - receive alert from dental practice
LICENSE_ID - FK for license

Dental Insurarnce:

INSURANCE_SUBSCRIBER_ID - PK, FK for billing insurance
START_DATE
EXPIRE_DATE
PROVIDER_NAME - FK for patients
INSURANCE_COVERAGE - max coverage amount, FK for patients
INSURANCE_PAYMENT - single insurance payment for a bill, FK for patients
INSURANCE_TYPE

Billing Insurance:

INSURANCE_SUBSCRIBER_ID
TREATMENTS
TREATMENT_DATE
AMOUNT_REQUESTED
INSURANCE_PAYMENT


Patient:

LAST_NAME
FIRST_NAME
STATES - contacted, scheduled, recently visited, up for next visit, dormant.
PROVIDER_NAME
INSURANCE_SUBSCRIBER_ID
COVERAGE_TYPE - insurance coverage type
INSURANCE_COVERAGE - max insurance coverage amount
AMOUNT_OWED
PATIENT_PAYMENT
INSURANCE_PAYMENT
PROCEDURES
TREATMENTS
TREATMENT_DATE
SURGERIES


Startup Cost:

PAYMENT_ID - PK
TYPE_ID - unique IDs for furniture, dental equipment, software, supplies, training, etc
TYPE_COST - cost for each type
TOTAL_STARTUP_COST - sum of Type_Cost for all the types

Bank:

LOAN - $300,000
INTEREST
BANK_PAYMENT - FK to recurrsive cost, calculated by loan and interest

Recursive Cost:

CHECKOUT_ID - PK
BANK_PAYMENT - got from bank
MONTHLY_LEASE_FEE - got from building
SALARY - got from staff
TOTAL_SUPPLY_COST - got from supplies
MONTHLY_PAYMENT - BANK_PAYMENT + MONTHLY_LEASE_FEE + SALARY + TOTAL_SUPPLY_COST

Building:

BUILDING_CODE - PK, FK for room
BUILDING_NAME
BUILDING_LOCATION
MONTHLY_LEASE_FEE - monthly fee, FK for recursive payment

Room:
// depend on building, weak entity

BUILDING_CODE - PK
ROOM_CODE - PK, FK for schedule
ROOM_RESERVATION - contains reservation for room numbers
ROOM_NUMBER
RESERVATION_PERIOD - contains time for reservation
DOCTOR_ID - doctors inside the room
PATIENT_ID - patients inside the room

Daily Report:

REPORT1_ID - PK
FINAL_PAYMENT - income daily got from payment
DAILY_PAYMENT - equals to FINAL_PAYMENT

Monthly Report:

REPORT2_ID - PK
FINAL_PAYMENT - income daily got from payment
MONTHY_PAYMENT - sum of all FINAL_PAYMENT from daily payment

Schedule:
// depend on room, weak entity

ROOM_CODE - PK
ROOM_RESERVATION - got from room, indicate reservations for all rooms

Supply:

SUPPLY_TYPE - everything from needles to drugs to paper towels
SUPPLY_COST - cost for each type
TOTAL_SUPPLY_COST - sum of SUPPLY_COST for all types

Payment:

PAYMENT_ID - PK
PATIENT_PAYMENT - got from patient
INSURANCE_PAYMENT - got from billing insurance
AMOUNT_OWED - got from patient, calculated by AMOUNT_REQUESTED - PATIENT_PAYMENT - INSURANCE_PAYMENT
AMOUNT_REQUESTED - got from billing insurance
FINAL_PAYMENT - FK for daily report / income, calculated by PATIENT_PAYMENT +  INSURANCE_PAYMENT

Billing Insurance:
// depend on dental insurance, weak entity

INSURANCE_SUBSCRIBER_ID - PK
TREATMENTS - got from patient
TREATMENT_DATE - got from patient
AMOUNT_REQUESTED - FK to payment
INSURANCE_PAYMENT - FK to payment
