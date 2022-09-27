CREATE TABLE patients (
    id INT GENERERATED ALWAYS AS IDENTITY,
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE invoices (
    id INT GENERERATED ALWAYS AS IDENTITY,
    total_amount DECIMALL NOT NULL,
    generated_at TIMESTAMP NOT NULL,
    payed_at TIMESTAMP NOT NULL,
    PRIMARY KEY(id)
);


CREATE TABLE medical_histories (
    id INT GENERERATED ALWAYS AS IDENTITY,
    admitted_at TIMESTAMP NOT NULL,
    patient_id INT NOT NULL,
    status VARCHAR(50) NOT NULL,
    PRIMARY KEY(id)
);

ALTER TABLE invoices ADD COLUMN medical_history_id INT NOT NULL;
ALTER TABLE invoices ADD FOREIGN KEY(medical_history_id) REFERENCES medical_histories(id);


CREATE TABLE invoice_items (
    id INT GENERERATED ALWAYS AS IDENTITY,
    unit_price DECIMALL NOT NULL,
    quantity INT NOT NULL,
    total_price DECIMALL NOT NULL,
    invoice_id INT NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE treatments (
    id INT GENERERATED ALWAYS AS IDENTITY,
    type VARCHAR(150) NOT NULL,
    name VARCHAR(150) NOT NULL,
    PRIMARY KEY(id)
);

ALTER TABLE invoice_items ADD COLUMN treatment_id INT NOT NULL;
ALTER TABLE invoice_items ADD FOREIGN KEY(treatment_id) REFERENCES treatments(id);

