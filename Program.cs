
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using API_MAUI_Server.Models;

var builder = WebApplication.CreateBuilder(args);

// Agregar conexión a SQL Server
builder.Services.AddDbContext<AppDbContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));

builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

app.UseSwagger();
app.UseSwaggerUI();
app.UseAuthorization();
app.MapControllers();
app.Run();
