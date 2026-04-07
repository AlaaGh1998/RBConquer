using System;
using System.Collections.Generic;

namespace RBConquer.Server.Systems
{
    public class MovementSystem
    {
        private Dictionary<int, CharacterPosition> positions;
        
        public MovementSystem()
        {
            positions = new Dictionary<int, CharacterPosition>();
        }
        
        public void UpdatePosition(int characterId, float x, float y, float z, float rotation)
        {
            if (!positions.ContainsKey(characterId))
                positions[characterId] = new CharacterPosition();
                
            positions[characterId].X = x;
            positions[characterId].Y = y;
            positions[characterId].Z = z;
            positions[characterId].Rotation = rotation;
            positions[characterId].LastUpdate = DateTime.Now;
        }
        
        public CharacterPosition GetPosition(int characterId)
        {
            return positions.ContainsKey(characterId) ? positions[characterId] : null;
        }
        
        public bool IsColliding(float x1, float y1, float z1, float x2, float y2, float z2, float radius = 1f)
        {
            float distance = (float)Math.Sqrt(Math.Pow(x2 - x1, 2) + Math.Pow(y2 - y1, 2) + Math.Pow(z2 - z1, 2));
            return distance < radius;
        }
        
        public List<CharacterPosition> GetNearbyCharacters(int characterId, float range = 50f)
        {
            var nearby = new List<CharacterPosition>();
            if (!positions.ContainsKey(characterId)) return nearby;
            
            var playerPos = positions[characterId];
            foreach (var pos in positions.Values)
            {
                float distance = (float)Math.Sqrt(Math.Pow(pos.X - playerPos.X, 2) + 
                                                   Math.Pow(pos.Y - playerPos.Y, 2) + 
                                                   Math.Pow(pos.Z - playerPos.Z, 2));
                if (distance < range && pos != playerPos)
                    nearby.Add(pos);
            }
            return nearby;
        }
    }
    
    public class CharacterPosition
    {
        public float X { get; set; }
        public float Y { get; set; }
        public float Z { get; set; }
        public float Rotation { get; set; }
        public DateTime LastUpdate { get; set; }
    }
}