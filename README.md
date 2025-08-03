# Itaú Unibanco Technical Test - Phase 2 (Technical Assessment)

## Context

This technical test focuses on **Variable Income** investments - a type of investment where returns are not fixed or predictable, unlike fixed income investments. The main characteristic of this investment type is the possibility of gains (or losses) according to market fluctuations. Stocks, Real Estate Investment Funds (REITs), and ETFs are common examples.

## Glossary

- **Asset**: Any item that has economic value and can be traded. In the financial market, assets are securities that represent participation (like stocks) or rights over something (like fund shares). Ex: ITSA3, KDIF11.
- **Price**: The price of an asset is determined by the law of supply and demand in the market. If more people want to buy than sell, the price goes up. If there are more sellers than buyers, the price falls.
- **Stock Exchange**: The environment where assets are traded. In Brazil, the main one is B3 (Brasil, Bolsa, Balcão).
- **Volatility**: The measure of price variation of an asset. High volatility means prices change significantly in short periods.
- **Dividends/JSP**: Part of the company's profit distributed to shareholders/quota holders. An attraction for those who invest in stocks/REITs focused on income.
- **Average Price**: Average of operation prices, subtracting dividends.
- **P&L**: Profit & Loss, client's profit/loss, amount paid vs current market price.
- **Operation Type**: Buy and Sell
- **Brokerage**: Amount paid to Itaú Brokerage for intermediating the operation with the Clearing (B3)

## Test Expectations

This test aims to assess the potential of each candidate by:
- Finding clues and paying attention to business and technical stories
- Quality, logic, extra studies (business knowledge)
- Well-made programming at the correct "difficulty/performance" level
- Good tests and documentation
- Creativity beyond just the storyline
- Proper use of AI tools for development acceleration (as used daily at Itaú)

## Tasks

### 1. Relational Database Modeling (MySQL Recommended)

Design tables for an investment control system:

**Tables:**
- Users (Id, Name, Email, %Brokerage)
- Assets (Id, Code, Name)
- Operations (Id, UserId, AssetId, Quantity, UnitPrice, OperationType, Brokerage, DateTime)
- Quote (Id, AssetId, UnitPrice, DateTime)
- Position (Id, UserId, AssetId, Quantity, AveragePrice, P&L)

**Tasks:**
1. Present SQL script for table creation (use abbreviations and snake_case)
2. Justify data type choices

### 2. Indexes and Performance

The system needs to quickly query all operations of a user for a specific asset in the last 30 days. Quotes can change in milliseconds and must affect client positions, P&L, and average prices in real-time.

**Tasks:**
1. Propose and justify one or more indexes for this query
2. Write optimized SQL query
3. Create structure for position updates based on quotes

### 3. Application

Create a .NET Core C# application (frontend at developer's discretion - console, forms, etc.) that accesses user operation data and calculates:
- Total invested per asset
- Position per security for an investor
- Global position of a client with profit or loss
- Total brokerage per client

**Tasks:**
1. Create application (without external dependencies) using good separation of concerns practices
2. Use async/await with Entity Framework or Dapper

### 4. Business Logic - Average Price

Implement a method that receives all purchases of an asset and calculates the weighted average acquisition price.

**Tasks:**
- Consider different quantities and prices for calculation
- Method must handle invalid inputs

### 5. Unit Tests

Using the previous method, create a battery of unit tests with xUnit or MSTest.

**Tasks:**
- Positive tests with expected values
- Error tests (zero quantity, empty lists)
- Clear and isolated structure

### 6. Mutation Testing

Explain the concept of mutation testing and its importance.

**Tasks:**
- Give an example of mutation applied to the average price method that would make a test fail

### 7. System Integration

An external microservice sends new quotes via Kafka.

**Tasks:**
- Add a .NET Worker Service to consume this queue and save quotes
- Include retry and idempotency strategies

### 8. Chaos Engineering

Your operations service must continue working even if the quotes service is unavailable.

**Tasks:**
- Apply circuit breaker, fallback, and observability in this scenario

### 9. Scalability and Performance

With system growth, operation volume increased to 1 million/day.

**Tasks:**
- Explain how to apply horizontal auto-scaling to the service
- Compare load balancing strategies (round-robin vs latency)

### 10. Documentation and APIs

Expose REST APIs to:
- Allow querying an asset and receive the latest quote
- Query average price per asset for a user
- Query a client's position
- View financial value earned by the brokerage from commissions
- Receive Top 10 clients with largest positions and Top 10 clients who paid most in brokerage

**Tasks:**
- Create RESTful endpoint example (method, URL, parameters)
- Outline documentation in OpenAPI 3.0 format (YAML or JSON)

## Useful Resources

- **Quote API**: https://b3api.vercel.app/
- **Learn more about Variable Income with Itaú**: https://www.itaucorretora.com.br/educacional/educacional.aspx
- **B3 Website**: https://www.b3.com.br/pt_br/produtos-e-servicos/negociacao/renda-variavel/

## Submission

After completion, publish on personal GitHub and send the path as response, preferably with the self-reference requested at the beginning.

---

**Note**: The document contains some encoded messages in binary and hexadecimal that may contain additional instructions or easter eggs for the technical assessment.