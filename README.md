# STSetu — MOTA-Aligned SIH Prototype

A lightweight two-surface prototype derived from the MOTA Unified Scholarship project direction.

## 1. Student Mobile App
`student_mobile/` — Flutter

Student-facing mobile flow: Login → Dashboard → Scholarship Schemes → Eligibility → Application Track → Document Wallet/DigiLocker → DBT → JAGO AI.

## 2. Admin / Officer Portal
`admin_portal/` — React + Vite

Officer flow: Overview → Applications → Verification Queue → DBT/Payments → Analytics.

## 3. Service Layer
`backend/` — FastAPI demo endpoints. Ready to be extended with SQLAlchemy, Pydantic, JWT, multipart uploads and live integrations.

## SIH positioning
Student mobile + officer web portal + FastAPI service layer. Government integrations (DigiLocker, DBT/PFMS, identity verification) are represented as demo/simulation points and are NOT live in this prototype.
