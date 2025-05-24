-- CONSULTAS
--Consulta 1
SELECT Nombre, Apellido 
FROM Estudiantes;

--CONSULTA 2
SELECT * FROM Cursos
WHERE Creditos = 3;

--Consulta 3
SELECT 
    E.Nombre AS NombreEstudiante,
    E.Apellido AS ApellidoEstudiante,
    C.NombreCurso AS CursoInscrito
FROM 
    Estudiantes E
INNER JOIN 
    Inscripciones I ON E.IDEstudiante = I.IDEstudiante
INNER JOIN 
    Cursos C ON I.IDCurso = C.IDCurso;

--Consulta 4
SELECT 
    E.Nombre AS NombreEstudiante,
    E.Apellido AS ApellidoEstudiante,
    COALESCE(C.NombreCurso, 'No inscrito') AS Curso
FROM 
    Estudiantes E
LEFT JOIN 
    Inscripciones I ON E.IDEstudiante = I.IDEstudiante
LEFT JOIN 
    Cursos C ON I.IDCurso = C.IDCurso;

--Consulta 5
SELECT 
    C.NombreCurso AS Curso,
    COALESCE(E.Nombre || ' ' || E.Apellido, 'Sin estudiantes inscritos') AS Estudiante
FROM 
    Estudiantes E
RIGHT JOIN 
    Inscripciones I ON E.IDEstudiante = I.IDEstudiante
RIGHT JOIN 
    Cursos C ON I.IDCurso = C.IDCurso
ORDER BY 
    C.NombreCurso;

--Consulta 6
SELECT 
    C.NombreCurso AS Curso,
    COUNT(I.IDEstudiante) AS Cantidad_Estudiantes
FROM 
    Cursos C
LEFT JOIN 
    Inscripciones I ON C.IDCurso = I.IDCurso
GROUP BY 
    C.NombreCurso
ORDER BY 
    Cantidad_Estudiantes DESC;

--Consulta 7
SELECT 
    IDEstudiante,
    Nombre,
    Apellido,
    FechaNacimiento,
    EXTRACT(YEAR FROM FechaNacimiento) AS AñoNacimiento
FROM 
    Estudiantes
WHERE 
    FechaNacimiento BETWEEN '1995-01-01' AND '1998-12-31'
ORDER BY 
    FechaNacimiento;

--Consulta 8
SELECT 
    IDCurso,
    NombreCurso AS Curso,
    Creditos,
    Semestre
FROM 
    Cursos
ORDER BY 
    NombreCurso ASC;

--Consulta 9
WITH InscripcionesPorEstudiante AS (
    SELECT 
        E.IDEstudiante,
        E.Nombre || ' ' || E.Apellido AS NombreCompleto,
        COUNT(I.IDInscripcion) AS TotalInscripciones
    FROM 
        Estudiantes E
    LEFT JOIN 
        Inscripciones I ON E.IDEstudiante = I.IDEstudiante
    GROUP BY 
        E.IDEstudiante, E.Nombre, E.Apellido
)
SELECT 
    NombreCompleto,
    TotalInscripciones
FROM 
    InscripcionesPorEstudiante
ORDER BY 
    TotalInscripciones DESC
LIMIT 3;

--Consulta 10
WITH CursosPorDepartamento AS (
    SELECT 
        D.IDDepartamento,
        D.NombreDepartamento,
        C.IDCurso,
        C.NombreCurso,
        COUNT(I.IDInscripcion) AS TotalInscritos,
        RANK() OVER (PARTITION BY D.IDDepartamento ORDER BY COUNT(I.IDInscripcion) DESC) AS Ranking
    FROM 
        Departamentos D
    INNER JOIN 
        Cursos C ON D.IDDepartamento = C.IDDepartamento
    LEFT JOIN 
        Inscripciones I ON C.IDCurso = I.IDCurso
    GROUP BY 
        D.IDDepartamento, D.NombreDepartamento, C.IDCurso, C.NombreCurso
)
SELECT 
    NombreDepartamento AS Departamento,
    NombreCurso AS Curso_Mas_Popular,
    TotalInscritos AS Estudiantes_Inscritos
FROM 
    CursosPorDepartamento
WHERE 
    Ranking = 1
ORDER BY 
    TotalInscritos DESC;
--Consulta 11
SELECT 
    P.Nombre,
    P.Apellido,
    COUNT(CP.IDCurso) AS Cantidad_Cursos
FROM 
    Profesores P
INNER JOIN 
    CursosProfesores CP ON P.IDProfesor = CP.IDProfesor
GROUP BY 
    P.IDProfesor, P.Nombre, P.Apellido
HAVING 
    COUNT(CP.IDCurso) > 2
ORDER BY 
    Cantidad_Cursos DESC;
--Consulta 12
WITH PromediosPorCurso AS (
    SELECT 
        PC.IDPrograma,
        C.IDCurso,
        C.NombreCurso,
        ROUND(AVG(I.Calificacion), 2) AS PromedioCalificacion,
        RANK() OVER (PARTITION BY PC.IDPrograma ORDER BY AVG(I.Calificacion) DESC) AS Ranking
    FROM 
        ProgramasCursos PC
    INNER JOIN 
        Cursos C ON PC.IDCurso = C.IDCurso
    LEFT JOIN 
        Inscripciones I ON C.IDCurso = I.IDCurso
    GROUP BY 
        PC.IDPrograma, C.IDCurso, C.NombreCurso
    HAVING 
        AVG(I.Calificacion) IS NOT NULL
)
SELECT 
    PE.NombrePrograma AS ProgramaEstudio,
    PPC.NombreCurso AS CursoMejorCalificado,
    PPC.PromedioCalificacion
FROM 
    PromediosPorCurso PPC
INNER JOIN 
    ProgramasEstudio PE ON PPC.IDPrograma = PE.IDPrograma
WHERE 
    PPC.Ranking = 1
ORDER BY 
    PPC.PromedioCalificacion DESC;