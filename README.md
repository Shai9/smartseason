# SmartSeason - Field Monitoring System

A field monitoring system for tracking crop progress across multiple fields during growing seasons. Built with **Ruby on Rails 7** and **Hotwire**, featuring role-based access for Admins and Field Agents.

## Project Overview

SmartSeason helps agricultural teams track field progress, manage crop data, and monitor field status in real-time. Admins coordinate all fields while agents update only their assigned fields.

## Key Features

-  Authentication System- Secure login with role-based access (Admin/Agent)
- Field Management - Create, edit, delete fields with crop types and planting dates
- Smart Status Logic - Automatic status calculation (Active/At Risk/Completed)
- Role-Based Dashboards - Different views for admins and agents
- Progress Tracking - Agents update stages and add observation notes
- Real-time Updates - Field status changes instantly based on update frequency



### Prerequisites
- Ruby 3.2.2+
- PostgreSQL 14+
- Rails 7.1+

### Installation

```bash
git clone https://github.com/Shai9/smartseason.git
cd smartseason

# Install dependencies
bundle install

# Setup database
rails db:create db:migrate db:seed

# Start server
rails server
```

### Login Credentials

| Role | Email | Password |
|------|-------|----------|
| Admin | admin@smartseason.com | admin123 |
| Agent | kimani@smartseason.com | kimani123 |
| Agent | abuya@smartseason.com | abuya123 |

## Status Logic

| Status | Condition |
|--------|-----------|
|  **Active** | Regular updates within 14 days |
|  **At Risk** | No updates for 14+ days  |
|  **Completed** | Field is Ready or Harvested |

## Tech Stack

- **Backend**: Ruby on Rails 7.1
- **Database**: PostgreSQL
- **Frontend**: Hotwire (Turbo + Stimulus)
- **Styling**: Custom CSS with Bricolage Grotesque font
- **Authentication**: Session-based with bcrypt

## Project Structure

```
smartseason/
├── app/
│   ├── controllers/    # Admin, Agent, Sessions controllers
│   ├── models/         # User, Field, Update models
│   └── views/          # Role-specific dashboards
├── config/
│   ├── routes.rb       # URL routing
│   └── database.yml    # Database config
└── db/
    ├── migrate/        # Schema migrations
    └── seeds.rb        # Test data
```

## User Flow

### Admin Flow
1. Login → View all fields dashboard
2. Add/Edit/Delete fields
3. Assign fields to agents
4. Monitor field status across all agents

### Agent Flow
1. Login → View only assigned fields
2. Update field stages (Planted → Growing → Ready → Harvested)
3. Add observation notes
4. Track personal field progress



This project was created as a software engineering assessment demonstrating full-stack Rails development capabilities.

## Author

SmartSeason - Field Monitoring System for Smart Agriculture

---

**Live Demo**: http://localhost:3000 (after running `rails server`)

**Repository**: https://github.com/Shai9/smartseason