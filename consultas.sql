-- =====================================================================
-- PROJETO CHURN TELECOM - ANÁLISE STRATÉGICA DE NEGÓCIO
-- =====================================================================

-- 1. Calculando a Taxa de Churn Geral da Empresa
SELECT 
    COUNT(ID_Cliente) AS Total_Clientes,
    SUM(CASE WHEN Churn = 'Sim' THEN 1 ELSE 0 END) AS Total_Cancelados,
    ROUND(SUM(CASE WHEN Churn = 'Sim' THEN 1 ELSE 0 END) * 100.0 / COUNT(ID_Cliente), 2) AS Percentual_Churn
FROM tb_clientes;

-- 2. Identificando o faturamento mensal que foi perdido (em risco)
SELECT 
    Churn,
    COUNT(ID_Cliente) AS Qtd_Clientes,
    ROUND(SUM(ValorMensal), 2) AS Faturamento_Total
FROM tb_clientes
GROUP BY Churn;

-- 3. Cruzando Reclamações no Suporte com o Churn
SELECT 
    ReclamacoesSuporte,
    COUNT(ID_Cliente) AS Total_Clientes,
    SUM(CASE WHEN Churn = 'Sim' THEN 1 ELSE 0 END) AS Clientes_Churn,
    ROUND(SUM(CASE WHEN Churn = 'Sim' THEN 1 ELSE 0 END) * 100.0 / COUNT(ID_Cliente), 2) AS Taxa_Churn_Por_Grupo
FROM tb_clientes
GROUP BY ReclamacoesSuporte
ORDER BY ReclamacoesSuporte;