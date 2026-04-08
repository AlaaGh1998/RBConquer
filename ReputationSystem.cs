// ReputationSystem.cs

using System;
using System.Collections.Generic;

namespace GameNamespace {
    public class ReputationSystem {
        private Dictionary<string, int> factionReputation;
        private Dictionary<string, List<string>> npcRelations;
        private Dictionary<string, string> factionRewards;

        public ReputationSystem() {
            factionReputation = new Dictionary<string, int>();
            npcRelations = new Dictionary<string, List<string>>();
            factionRewards = new Dictionary<string, string>();
        }

        public void SetReputation(string faction, int reputation) {
            factionReputation[faction] = reputation;
        }

        public int GetReputation(string faction) {
            return factionReputation.ContainsKey(faction) ? factionReputation[faction] : 0;
        }

        public void AddNpcRelation(string npc, string faction) {
            if (!npcRelations.ContainsKey(npc)) {
                npcRelations[npc] = new List<string>();
            }
            npcRelations[npc].Add(faction);
        }

        public List<string> GetNpcRelations(string npc) {
            return npcRelations.ContainsKey(npc) ? npcRelations[npc] : new List<string>();
        }

        public void SetFactionReward(string faction, string reward) {
            factionRewards[faction] = reward;
        }

        public string GetFactionReward(string faction) {
            return factionRewards.ContainsKey(faction) ? factionRewards[faction] : "No Reward";
        }
    }
}