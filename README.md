# Github dlt-dbt Package

### Overview
The Github dlt-dbt package offers data models to help you transform and analyze Github data. It's designed to integrate seamlessly with the dlt Github pipeline, which extracts and loads Github data into your data warehouse.

### Who is this for?
This package is perfect for dbt users who want to integrate Github data into their analytics workflows without building models from scratch.


### Key Features
- **Staging Models:** Clean and prepare raw Github data for downstream analysis.
- **Mart Models:** Pre-built dimension and fact tables for key Github entities like events, reactions.
- **Incremental Loading:** Supports incremental data processing to optimize performance.
- **Easy Integration:** Designed to work out-of-the-box with the dlt Github pipeline.

### Setup Instructions

#### Prerequisites
- dbt Core installed in your environment.
- Access to a supported data warehouse: BigQuery, Snowflake, Redshift, Athena, or PostgreSQL.
- The dlt Github pipeline is set up and running.

### Step 1: Set Up the dlt Github Pipeline
1. **Install dlt:**
   ``` 
   pip install dlt
   ```
2. **Configure the Pipeline:**
   Follow the dlt Github [pipeline documentation](https://dlthub.com/docs/dlt-ecosystem/verified-sources/github) to set up your pipeline. Ensure you have your Github API key and destination credentials configured.

3. **Run the Pipeline:**
   Extract and load data from Github into your data warehouse by running the Github events. As GitHub pipeline integrates multiple sources. Here, we will build a model for the `github_events` source. For more details on sources, refer to the [documentation](https://dlthub.com/docs/general-usage/source).

### Step 2: Install and Configure the dbt Project

1. Install the Github dbt package into your dbt environment.
2. Configure your 'dbt_project.yml' file with the appropriate connection details for your data warehouse.
3. Ensure the data from your dlt Github events pipeline is available in your warehouse. 

This is how the tables in dbt packages look like:

For Github events:

```text
dbt_github_events/
├── analysis/
├── macros/
├── models/
│   ├── marts/
│   │   ├── dim__dlt_loads.sql
│   │   ├── dim_create_event.sql
│   │   ├── dim_delete_event.sql
│   │   ├── dim_fork_event.sql
│   │   ├── dim_issue_comment_event.sql
│   │   ├── dim_issues_event.sql
│   │   ├── dim_pull_request_event.sql
│   │   ├── dim_pull_request_review_comment_event.sql
│   │   ├── dim_pull_request_review_event.sql
│   │   ├── dim_push_event__payload__commits.sql
│   │   ├── dim_push_event.sql
│   │   ├── dim_watch_event.sql
│   ├── staging/
│   │   ├── stg__dlt_loads.sql
│   │   ├── stg_create_event.sql
│   │   ├── stg_delete_event.sql
│   │   ├── stg_fork_event.sql
│   │   ├── stg_issue_comment_event.sql
│   │   ├── stg_issues_event.sql
│   │   ├── stg_pull_request_event.sql
│   │   ├── stg_pull_request_review_comment_event.sql
│   │   ├── stg_pull_request_review_event.sql
│   │   ├── stg_push_event__payload__commits.sql
│   │   ├── stg_push_event.sql
│   │   ├── stg_watch_event.sql
│   ├── dlt_active_load_ids.sql  # Used for incremental processing of data
│   ├── dlt_processed_load.sql   # Used for incremental processing of data
├── tests/
├── dbt_project.yml
└── requirements.txt
```

### Step 3: Run dbt
Execute the dbt models to transform the raw Github data into useful tables:

```sh
dbt build
```

### Customization
While this package provides a solid foundation, you can customize it to suit your specific needs:

- Modify the models to align with your business logic.
- Add relationships between tables by modifying your dlt pipeline schema.

> The dimensional modelling part of the package was created with a declarative code generator and suffers from 
> limitations inherent to modelling raw data directly. We advise you consider the raw data tables and adjust 
> the modelled layer as needed.

### Schema diagram
The dbt model above can be further customized according to the requirements. Using this package you'll get a basic template
for data model which can be further modified as required.

1. The schema of data modelled Github events above using dlt-dbt-generator:
    
   ![picture](https://storage.googleapis.com/dlt-blog-images/github_events_dlt_dbt_v0.1.0.png)

   Here's the link to the DB diagram: [link](https://dbdiagram.io/d/github_events_dlt_dbt_v0-1-0-67a1d258263d6cf9a0f47e0e)

> ⚠️ **Note:**
> 
> Please note that this is a starting template for your data model and is not the final product. It is advised to customize the data model as per your needs.


#### Optional: Advanced Usage (Generator and Licensing)

This package was created using the dlt-dbt-generator by dlt-plus. For more information about dlt-plus, refer to the 
[dlt-plus documentation.](https://dlt-plus.netlify.app/docs/plus/intro/). To learn more about the dlt-dbt-generator, 
consult the [dlt-dbt-generator](https://dlthub.com/blog/dbt-gen) documentation.

> The dimensional modelling part of the package was created with a declarative code generator and suffers from 
> limitations inherent to modelling raw data directly. We advise you consider the raw data tables and adjust 
> the modelled layer as needed
