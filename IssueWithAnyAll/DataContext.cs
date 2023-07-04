using IssueWithAnyAll.Configs;
using IssueWithAnyAll.Entities;
using Microsoft.EntityFrameworkCore;
using File = IssueWithAnyAll.Entities.File;

namespace IssueWithAnyAll;

public class DataContext : DbContext
{
    private static string connectionString;


    public DataContext()
        : base()
    {
    }

    private string ConnectionString { get; set; }

    public DataContext(string connectionString) : base()
    {
        this.ConnectionString = connectionString;
    }

    
    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        optionsBuilder.UseSqlServer(this.ConnectionString);

        base.OnConfiguring(optionsBuilder);
    }

    public DbSet<RequestType> RequestTypes { get; set; }

    public DbSet<RequestStatus> RequestStatuses { get; set; }

    public DbSet<Request> Requests { get; set; }

    public DbSet<File> Files { get; set; }

    public DbSet<Vote> Votes { get; set; }
    public DbSet<VoteDocument> VoteDocuments { get; set; }

    public DbSet<MeetingRequest> MeetingRequests { get; set; }

    protected override void OnModelCreating(ModelBuilder builder)
    {

        builder.HasDefaultSchema("dbo");

        builder.ApplyConfiguration(new RequestConfig());
        builder.ApplyConfiguration(new RequestTypeConfig());
        builder.ApplyConfiguration(new RequestStatusConfig());
        builder.ApplyConfiguration(new VoteConfig());
        builder.ApplyConfiguration(new FileConfig());
    }
}
