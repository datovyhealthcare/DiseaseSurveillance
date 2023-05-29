# DiseaseSurveillance
CDC Communicable Disease Surveillance
## Datovy Healthcare
# Communicable Diseases Data Repository

## <span style="color:skyblue;font-weight:bold">INTRODUCTION</span>
The purpose of this effort is to provide free and accessible base database schema for healthcare communicable diseases (disease tracking, monitoring, control, contract tracing, and infectious disease detection and response) in a simple design while being adaptable and flexible enough for daily on-line transaction processing.  The designed repository is not tailored to any specific disease but generic in nature and could support any related tracking effort based on a set of conditions.  Additionally the model supports Healthcare services (programs) such as those supported by Psychosocial initiatives, mental health, substance abuse, and other community benefits to.

Concerns about Privacy and Security are targeted by "tagging" to help start related compliance efforts (see the "Privacy and Security Concerns" section ahead).

This is work in progress and therefore all provided resources may change, be elaborated and documented at any time.  Contribute to shape this offering and make it useful for the community.

## <span style="color:skyblue;font-weight:bold">DISEASE TRACKING AND MONITORING</span>
The provided database schema may be useful for various applications but has been defined as a small repository that could be useful for the definition of a micro-service.  A few "Disease Tracking and Monitoring" scenarios were considered including:

- Walk-in - a person that visit a center (such as a healthcare facility, government agency, or other) or call to ask questions about a disease specifics or offering process but does not go through any assessment and no associated Case is created or available.  In this scenario a Contact may be created as needed.
- Referral based - where a subject visits a center and has a referral issued by a Practitioner or other and goes through an assessment or process.
- Subjects tracking - given an activity that requires an investigation to understand how a disease could have propagated.
- Agency or Institution Programs - existing disease tracking, monitoring, servicing programs to manage cases in their region or communities.
- CDC Contract Tracing guidelines and related process.

Hopefully the above and other scenarios will be defined and documented in detail and made available as contributions to this effort are made available.

## <span style="color:skyblue">Information Resources</span>
To support tracking and monitories and other needed efforts a database design has been created to be minimal, flexible, and useful for:

- Reference and Track People and Contacts.
- Support external or internal Referrals.
- Manage Disease Profiles identifying the characteristics of the disease or target population.
- Manage Cases specific to a Person to understand how the disease could be propagated to others.
- Manage Case related Activities and Events while performing Assessments, providing analysis or treatment services to the Case Subject and others.
- Manage references to Laboratory requests and results related to a Case.
- Manage Case - Person Immunization efforts.

This is a starting point that we hope it will expand over time.

## <span style="color:skyblue;font-weight:bold">PRIVACY AND SECURITY CONCERNS</span>
To get started with efforts related to Privacy and Security HIPAA and other regulations, best practices and initiatives data elements, tables, columns or other resources may be tagged.

The specific Privacy and Security tags are supported for:

- HIPAA - HHS Health Insurance Portability and Accountability Act
- GDPR - General Data Protection Regulation
- PII - Person Identifiable Information
- NIST-PII - Person Identifiable Information

We hope to have a comprehensive list of tagged resources that will be enhanced over time as needed.

## <span style="color:skyblue;font-weight:bold">NAMING CONVENTION</span>
To ease the identification of modeled artifacts all names had been arranged with the primary topic or entity at the beginning followed by secondary topics or entities, follow by attributes, indicator, or other descriptor.

For example:

- A Person name will begin with what it is "Name" followed by what part of the name it is "Given", "Middle" or "Family" name components.
- The Person education details are written starting with "Education" followed by what we will like to know about the "Degree" followed by what kind it is "Highest".

This convention follows a welknown AI patterns "Entity - Attribute - Value" (EAV) to represent knowledge that can be easily used in inference systems and others.  To minimize confusion each word that represents an entity, attribute, verb or other is by its own separated with an underscore.

## <span style="color:skyblue">Abbreviations and Compound Words</span>
While abbreviations are discouraged as needed use them surrounded by underscores.  Finally, as possible all compound words are avoided but if used kept to a minimum.  Preferably if any of those are used those should conform to well-known abbreviations or compounds, or accepted by the target community.

## <span style="color:skyblue;font-weight:bold">DATABASE DESIGN CONSIDERATIONS</span>
Within a relational database data entities (tables) are detailed using a reference based schema with the objective to reduce the amount of objects being modeled.

Data entities are mostly generic (such as Person, Activities, Locations, Notes, Medias, and others) providing the needed flexibility to add information for multiple use cases without changing its design or adding too many tables.

Instead of having specific tables for a Customer, Patient or other a single Person table is provided.  Upon a specific Case the person participates as a "Patient", "Practitioner", "Custodian" or other and added as a "Participant" to "Activities", "Events" as needed.  This also provide the flexibility to reference the person within multiple roles.  Encounters can be managed by adding "Activities" and related "Events".

## <span style="color:skyblue">Database Schemas</span>
Different business areas represented using a schema include:

- Application - specific application related data entities are defined here.
- Core - this schema holds commonly used data components frequently referenced by others including Location, Notes, Medias, and others.
- Entity - this schema includes base entities such as Organizations, Officers, Contacts, and Persons.  Note the absent of patient and related derived entities since they can be referenced as such using these base entities.
- Healthcare - common data components used by other to refer to health care entities including Immunization, Laboratory, Medical Conditions, Medication, Provider, Treatment and related code sets.
- Management - here the Case, Referrals, and Schedules are available.
- Tracing - Contact Tracing specific data components including Assessments, Profiles, and Travel Details.

Other data entities may be included in later versions as needed while the model matures through community contributions, and reviews.

## <span style="color:skyblue">Tables</span>
Table names are kept as simple and direct as possible.  It is expected and recommended that when a table is joined with another that its name is used as the alias.

## <span style="color:skyblue">Table Colums</span>
Table column names are kept as short as possible.  The primary key name is the table name ending with "_ID".  Name cacophony (meaning the repetition of a name multiple times) is discourage and instead of saying "Person.Person_Name" the repeated name is removed to have "Person.Name".

## <span style="color:skyblue">Code Sets</span>
Code sets are primarily key-value pairs such as Code_ID and a Description.  At some point some may grow and ease their use a Category_ID column is provided that should be used to group those based on how they related to each other.  Some of the common codes are kept in the "Core" database schema to be used and referenced as needed from any other schema.

Note that any table whose name ends with "_Code", "_Type", or "_Category" is a Code Set.

Code ID's should be as explicit as possible making it easy to understand, mapped to business entities, and manage those.  For example, the full word codes are supported within a length of 30 characters such as "male" or "female" for the sex code.

## <span style="color:skyblue">Assocciations</span>
Many to many relationships can be defined using an association that some also call a "Bridge" table.  In this version an association table end with the word "_Link".

## <span style="color:skyblue">Non-identifying Relationships</span>
For example, instead of adding a "Note" table for each data entity, only one is provided.  With the use of "non-identifying relationships" a reference ID will point to the corresponding entity and using a relationship qualifier the reference-entity of interest is being stated.

## <span style="color:skyblue">Table Partitioning</span>
Onece those tables grow to a considerable size the table should be partitioned to improve performance.

## <span style="color:skyblue">Record Management</span>
Enough metadata details about record management are provided as a starting point.  Details about each column could be found in the documentation folder.

## <span style="color:skyblue;font-weight:bold">DICTIONARIES - SCHEMAS</span>
Associated with this contribution Datovy released a separate project that was used to prepare a full sample of a Data Dictionary, Schemas in various languages including XSD and JSON Schema among other resources.  The EDAM (Enterprise Data Asset Management) Windows (WinUI) desktop App was used to produce these artifacts and can be found as Datovy.Edam.

## <span style="color:skyblue;font-weight:bold">ROAD MAP</span>
The following is a tentative plan that will be modified based on the community feedback:
1) Define the Communicable Disease (CD) Database Schema.
2) Create an API to expose the CD data entities.
3) Create sample CD CDC HL7 based Message Reports.

## <span style="color:skyblue;font-weight:bold">RESOURCES</span>
Associated with this project are resources that include Use Cases and documentation that could be found in the "Use Cases" folder.
## <span style="color:skyblue;font-weight:bold">REFERENCE & LINKS</span>
[1] CDC Centers for Disease Control and Prevention -
    National Notifiable Diseases Surveillance System (NNDS) -
    https://www.cdc.gov/nndss/index.html

## <span style="color:skyblue;font-weight:bold">KNOWN ISSUES</span>
- Code Set categories values had been added for some but there are entries that may not apply to the underlying concept or apply to all (see next issue).
- Some Code Sets for a specific concept had been added to a single set and can't be separated by their specific scenario or application (i.e. Clinical Stage / Surveillance Stage).  This may change other versions.
- Some Code Sets could be centralized, if so since each database schema is isolated no foreign key is possible.  This version 0, will have a copy of needed code sets.

## <span style="color:skyblue;font-weight:bold">LAKEHOUSE CONNECTIVITY</span>
We have been working with the Dremio Lakehouse docker container that we hope to later become a target for analytics for this project.

To connect to an SQL Server from the Dremio container add a source and just use "host.docker.internal\." as your server name for a default installation, this will represent the container host ip-address and 
"\." a reference to your default instance.  Change it to "...\my-instance-name" as needed.
