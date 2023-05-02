-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Campaign" (
    "cf_id" INT   NOT NULL,
    "contact_id" INT   NOT NULL,
    "company_name" CHAR   NOT NULL,
    "description" CHAR   NOT NULL,
    "goal" INT   NOT NULL,
    "pledged" CHAR   NOT NULL,
    "outcome" CHAR   NOT NULL,
    "backers_count" INT   NOT NULL,
    "country" CHAR   NOT NULL,
    "currency" INT   NOT NULL,
    "launched_date" DATE   NOT NULL,
    "end_date" DATE   NOT NULL,
    "category_id" CHAR   NOT NULL,
    "subcategory_id" CHAR   NOT NULL,
    CONSTRAINT "pk_Campaign" PRIMARY KEY (
        "category_id","subcategory_id"
     )
);

CREATE TABLE "Category" (
    "category_id" CHAR   NOT NULL,
    "category" CHAR   NOT NULL
);

CREATE TABLE "Subcategory" (
    "subcategory_id" CHAR   NOT NULL,
    "subcategory" CHAR   NOT NULL
);

CREATE TABLE "Crowdfunding" (
    "cf_id" INT   NOT NULL,
    "contact_id" INT   NOT NULL,
    "company_name" CHAR   NOT NULL,
    "blurb" CHAR   NOT NULL,
    "goal" INT   NOT NULL,
    "pledged" INT   NOT NULL,
    "outcome" CHAR   NOT NULL,
    "backers_count" INT   NOT NULL,
    "country" CHAR   NOT NULL,
    "currency" INT   NOT NULL,
    "launched_at" DATE   NOT NULL,
    "deadline" DATE   NOT NULL,
    "staff_pick" CHAR   NOT NULL,
    "spotlight" BOOLEAN   NOT NULL,
    "category" CHAR   NOT NULL,
    "sub-category" CHAR   NOT NULL
);

ALTER TABLE "Campaign" ADD CONSTRAINT "fk_Campaign_category_id" FOREIGN KEY("category_id")
REFERENCES "Category" ("category_id");

ALTER TABLE "Campaign" ADD CONSTRAINT "fk_Campaign_subcategory_id" FOREIGN KEY("subcategory_id")
REFERENCES "Subcategory" ("subcategory_id");

ALTER TABLE "Category" ADD CONSTRAINT "fk_Category_category" FOREIGN KEY("category")
REFERENCES "Crowdfunding" ("category");

ALTER TABLE "Crowdfunding" ADD CONSTRAINT "fk_Crowdfunding_sub-category" FOREIGN KEY("sub-category")
REFERENCES "Subcategory" ("subcategory");
