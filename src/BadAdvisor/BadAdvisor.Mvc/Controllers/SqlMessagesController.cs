using System;
using System.Linq;
using System.Threading.Tasks;
using BadAdvisor.Mvc.Data;
using BadAdvisor.Mvc.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace BadAdvisor.Mvc.Controllers
{
    [Route("sqlMessages")]
    public class SqlMessagesController : Controller
    {
        private static Random _rand = new(DateTime.UtcNow.Millisecond);
        private readonly BadAdVisorContext _dbContext;

        public SqlMessagesController(BadAdVisorContext dbContext)
        {
            _dbContext = dbContext;
        }

        [HttpGet("random")]
        public async Task<IActionResult> GetRandom()
        {
            var messages = await _dbContext.Messages.ToListAsync();
            var maxNumber = messages.Count;

            var randomNumber = _rand.Next(1, maxNumber);
            var message = messages.First(x => x.MessageId == randomNumber);

            return new JsonResult(new MessageModel()
            {
                Likes = message.Likes,
                Text = message.Text,
                TimesCopied = message.TimesCopied,
            });
        }
    }
}
