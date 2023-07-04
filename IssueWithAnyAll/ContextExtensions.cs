using Z.EntityFramework.Plus;

namespace IssueWithAnyAll;

public static class ContextExtensions
{
    public static IQueryable<TEntity> IncludeOptimizedMultiple<TEntity>(
        this IQueryable<TEntity> query,
        IEnumerable<string> includes) where TEntity : class
    {
        if (includes != null)
        {
            query = includes
                .Aggregate(query, (current, include) => current.IncludeOptimizedByPath(include));
        }

        return query;
    }
}
