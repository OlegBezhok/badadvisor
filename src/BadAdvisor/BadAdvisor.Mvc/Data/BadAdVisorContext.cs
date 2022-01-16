using Microsoft.EntityFrameworkCore;

namespace BadAdvisor.Mvc.Data
{
    public sealed class BadAdVisorContext : DbContext
    {
        public DbSet<Message> Messages { get; set; }

        public BadAdVisorContext(DbContextOptions<BadAdVisorContext> options)
            : base(options)
        {
            Database.EnsureCreated();
        }
    }
}
