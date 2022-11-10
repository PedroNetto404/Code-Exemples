--- BEGIN TRY
---     { instrução_sql | bloco_de_instruções }
--- END TRY
--- BEGIN CATCH
---     [{ instrução_sql | bloco_de instruções }]
--- END CATCH

--- THROW [{ número_do_erro | @variável_local },
---     {mensagem | @variável_local },
---     {estado | @variável_local },
--- ] [ ; ]

-- número_do_erro deve estar entre 50.000 e 2.147.483.647

BEGIN TRY
    SELECT 1/0;
END TRY
BEGIN CATCH
    THROW
END CATCH

BEGIN TRY
    SELECT 1/0;
END TRY
BEGIN CATCH
    THROW 51000, 'Você dividiu por zero!!!', 1;
END CATCH
