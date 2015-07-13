using System.Configuration;
using System.IO;
using meridian.core;
using meridian.diagram;

namespace meridian.bewell.codegen
{
    class Program
    {
        static void Main(string[] args)
        {
            string connectionString = GetConnectionString();
            string solutionDirectory = PathUtils.DetectSolutionPath();
            string contextFilePath = Path.Combine(solutionDirectory, @"..\etc\context\bewell.xml");
            const string project = "meridian.bewell";

            var dg = new MySqlDiagramContext(connectionString);
            dg.GetOperationContext().Load(contextFilePath);
            dg.SyncTable("hotels");
            //dg.SyncTable("resorts");
            //dg.SyncControllers();
            
            var basicGenerator = new MysqlGenerator(dg.GetOperationContext(), dg.GetBackendOperationContext());
            basicGenerator.Namespace = project;
            basicGenerator.ProjectName = project;
            
            //basicGenerator.Generate();
            
            Parser parser = new Parser();
            parser.Feeder = new ConsoleFeeder();
            parser.Executor = new SimpleExecutor(dg);
            parser.Generator = basicGenerator;
            parser.Launch();
            

            dg.GetOperationContext().Save(contextFilePath);
        }

        private static string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["default"].ConnectionString;
        }
    }
}
