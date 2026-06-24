using System;
using System.IO;
using System.Globalization;
using System.Linq;
using System.Collections.Generic;
using CsvHelper;
using CsvHelper.Configuration;
using ParquetSharp;
using System.IO.Compression;
using Npgsql;

class Program
{
    static string connectionString = "Host=localhost;Username=postgres;Password=senha;Database=Feminicidio;Command Timeout=0;Timeout=300";

    static void Main(string[] args)
    {
        GarantirBanco();

        string zipPath = @"C:\Users\marca\Downloads\archive (1).zip";
        string extractPath = @"C:\Users\marca\Downloads\archive_extracted";

        if (!Directory.Exists(extractPath))
        {
            ZipFile.ExtractToDirectory(zipPath, extractPath);
            Console.WriteLine("ZIP extraído.");
        }

        foreach (var arquivo in Directory.GetFiles(extractPath))
        {
            string nomeTabela = Path.GetFileNameWithoutExtension(arquivo).ToLower();

            if (arquivo.EndsWith(".csv", StringComparison.OrdinalIgnoreCase))
            {
                CriarTabelaCsv(arquivo, nomeTabela);
                ProcessarCsvComCopy(arquivo, nomeTabela);
            }
            else if (arquivo.EndsWith(".parquet", StringComparison.OrdinalIgnoreCase))
            {
                CriarTabelaParquet(arquivo, nomeTabela);
                ProcessarParquetComCopy(arquivo, nomeTabela);
            }

            ContarLinhas(nomeTabela);
        }
    }

    static void GarantirBanco() { }
    static string InferirTipo(string valor) { return ""; }
    static void CriarTabelaCsv(string caminhoCsv, string nomeTabela) { }
    static void ProcessarCsvComCopy(string caminhoCsv, string nomeTabela) { }
    static void CriarTabelaParquet(string caminhoParquet, string nomeTabela) { }
    static void ProcessarParquetComCopy(string caminhoParquet, string nomeTabela) { }
    static void ContarLinhas(string nomeTabela) { }
}