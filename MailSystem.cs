// Example content for MailSystem.cs
// Implementation of player mail messaging and item delivery

using System;
using System.Collections.Generic;

namespace GameMailSystem {
    public class MailSystem {
        private List<Mail> mails;

        public MailSystem() {
            mails = new List<Mail>();
        }

        public void SendMail(Player sender, Player receiver, string message, Item item) {
            Mail newMail = new Mail(sender, receiver, message, item);
            mails.Add(newMail);
            Console.WriteLine("Mail sent from " + sender.Name + " to " + receiver.Name);
        }

        public void DeliverMail(Player player) {
            foreach (var mail in mails) {
                if (mail.Receiver == player) {
                    // Deliver item if present
                    if (mail.Item != null) {
                        player.ReceiveItem(mail.Item);
                    }
                    Console.WriteLine("Mail delivered to " + player.Name);
                }
            }
        }
    }

    public class Mail {
        public Player Sender { get; }
        public Player Receiver { get; }
        public string Message { get; }
        public Item Item { get; }

        public Mail(Player sender, Player receiver, string message, Item item) {
            Sender = sender;
            Receiver = receiver;
            Message = message;
            Item = item;
        }
    }

    public class Player {
        public string Name { get; set; }

        public Player(string name) {
            Name = name;
        }

        public void ReceiveItem(Item item) {
            // Logic for receiving item
            Console.WriteLine(Name + " received an item.");
        }
    }

    public class Item {
        public string Name { get; set; }

        public Item(string name) {
            Name = name;
        }
    }
}