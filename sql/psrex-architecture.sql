--nodes
CREATE TABLE pharmasuite.PSREX_NODES (
    ID int NOT NULL PRIMARY key AUTO_INCREMENT,
    name varchar(255),
    node_type ENUM ('Database', 'RabbitMQ', 'JavaModule', '.NET'),
    description varchar(255),
    internal ENUM ('internal','external'),
    repo_url varchar(255),
    framework ENUM ('JavaEE', 'SpringBoot', 'Micronaut')
);
drop table pharmasuite.PSREX_NODES;
select * from pharmasuite.PSREX_NODES;

--edges
CREATE TABLE pharmasuite.PSREX_EDGES (
    ID int NOT NULL PRIMARY key AUTO_INCREMENT,
    name varchar(255),
    left_node_id int,
    right_node_id int,
    flow_id int,
    connection_type ENUM ('RESTCall', 'FTPCall', 'QueuePush', 'QueuePull', 'DatabaseInsert', ,'DatabaseSelect')
    destination_url varchar(255),
    endpoint_called_verb varchar(255),
    call_description varchar(255)
);
drop table pharmasuite.PSREX_EDGES;
select * from pharmasuite.PSREX_EDGES;
INSERT INTO pharmasuite.PSREX_EDGES (name, left_node_id, right_node_id, endpoint_called_url, endpoint_called_verb, call_description) VALUES('Edge', 1, 2, 'http://', 'GET', 'Get all articles');

--flows
CREATE TABLE pharmasuite.PSREX_FLOWS (
    ID int NOT NULL PRIMARY key AUTO_INCREMENT,
    name varchar(255),
    description varchar(1255)
);
drop table pharmasuite.PSREX_FLOWS;
select * from pharmasuite.PSREX_FLOWS;
INSERT INTO pharmasuite.PSREX_FLOWS (name, description) VALUES('Article import with PSREX', 'There is an integration (I think Vara Connect) that imports articles as .zip from the external Vara EHM (FTP) service to the servlet present on PSREX server module. The PSREX Server module sends articles to Rabbit. The PSREX Articles module pulls from Rabbit and writes articles in DB. There is another integration that writes articles from this DB to the DB PSO module uses.');
INSERT INTO pharmasuite.PSREX_FLOWS (name, description) VALUES('Article import with PSO', 'There is also an integration (I think Vara Connect) that imports articles from the external Vara EHM (FTP) service to the DB PSO module uses.');

--containers
CREATE TABLE pharmasuite.PSREX_CONTAINERS (
    ID int NOT NULL PRIMARY key AUTO_INCREMENT,
    image_name varchar(255),
    module_node_Id int,
    am_server ENUM ('am1', 'am2', 'am3'),
    version_deployed varchar(255),
    jira_fix_version varchar(255)
);
drop table pharmasuite.PSREX_CONTAINERS;
select * from pharmasuite.PSREX_CONTAINERS;
INSERT INTO pharmasuite.PSREX_CONTAINERS (image_name, module_node_Id, am_server, version_deployed, jira_fix_version) VALUES('latest', 1, 'am3', '1.2', '11.1');
