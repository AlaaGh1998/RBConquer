// BossSystem.cs

using System;
using System.Collections.Generic;

public class BossSystem
{
    public string Name { get; private set; }
    public int Health { get; private set; }
    public int Damage { get; private set; }
    public List<string> SpecialAbilities { get; private set; }
    public Dictionary<string, int> LootDistribution { get; private set; }

    public BossSystem(string name, int health, int damage)
    {
        Name = name;
        Health = health;
        Damage = damage;
        SpecialAbilities = new List<string>();
        LootDistribution = new Dictionary<string, int>();
    }

    public void AddSpecialAbility(string ability)
    {
        SpecialAbilities.Add(ability);
    }

    public void TakeDamage(int amount)
    {
        Health -= amount;
        if (Health < 0) Health = 0;
    }

    public void DistributeLoot(string item, int quantity)
    {
        if (LootDistribution.ContainsKey(item))
        {
            LootDistribution[item] += quantity;
        }
        else
        {
            LootDistribution[item] = quantity;
        }
    }

    public void DisplayStatus()
    {
        Console.WriteLine($"Boss: {Name}, Health: {Health}, Damage: {Damage}");
        Console.WriteLine($"Special Abilities: {string.Join(", ", SpecialAbilities)}");
        Console.WriteLine("Loot Distribution:");
        foreach (var loot in LootDistribution)
        {
            Console.WriteLine($" - {loot.Key}: {loot.Value}");
        }
    }
}