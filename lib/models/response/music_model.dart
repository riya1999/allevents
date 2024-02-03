import 'dart:convert';

MusicData getMusicListResponseFromJson(String str) => MusicData.fromJson(json.decode(str));

String getMusicListResponseToJson(MusicData data) => json.encode(data.toJson());

class MusicData {
  List<ItemsData>? itemsData;

  MusicData({
    this.itemsData,

  });

  factory MusicData.fromJson(Map<String, dynamic> json) => MusicData(
    itemsData: json["item"] == null ? [] : List<ItemsData>.from(json["item"]!.map((x) => ItemsData.fromJson(x))),

  );

  Map<String, dynamic> toJson() => {
    "item": itemsData == null ? [] : List<dynamic>.from(itemsData!.map((x) => x.toJson())),
  };
}

class ItemsData {
  String? eventId;
  String? eventRawName;
  String? thumbNailUrlLage;
  String? startDate;
  String? endDate;
  String? location;
  String? ownerId;
  String? label;
  String? featured;
  String? eventUrl;
  String? shareUrl;
  String? bannerUrl;
  String? eventName;
  String? thumbUrl;
  String? score;
  List<String>? categories;
  List<String>? tags;
  Venue? venueData;
  Ticket? ticket;

  ItemsData({
    this.eventId,
    this.eventRawName,
    this.thumbNailUrlLage,
    this.location,
    this.endDate,
    this.ownerId,
    this.startDate,
    this.categories,
    this.tags,
    this.score,
    this.shareUrl,
    this.label,
    this.eventUrl,
    this.bannerUrl,
    this.eventName,
    this.featured,
    this.thumbUrl,
    this.venueData,
    this.ticket
  });

  factory ItemsData.fromJson(Map<String, dynamic> json) => ItemsData(
    eventId: json["event_id"],
    eventRawName: json["eventname_raw"],
    thumbNailUrlLage: json["thumb_url_large"],
    startDate: json["start_time_display"],
    endDate: json["end_time_display"],
    location: json["location"],
    ownerId: json["owner_id"],
    label: json["label"],
    featured: json["featured"].toString(),
    eventUrl: json["event_url"],
    shareUrl: json["share_url"],
    bannerUrl: json["banner_url"],
    eventName: json["eventname"],
    thumbUrl: json["thumb_url"],
    score: json["score"].toString(),
    categories: json["categories"].cast<String>(),
    tags: json["tags"].cast<String>(),
    venueData: json["venue"] == null ? null : Venue.fromJson(json["venue"]),
    ticket: json["tickets"] == null ? null : Ticket.fromJson(json["tickets"]),
  );

  Map<String, dynamic> toJson() => {
    "event_id": eventId,
    "eventname_raw": eventRawName,
    "thumb_url_large": thumbNailUrlLage,
    "start_time_display": startDate,
    "end_time_display": endDate,
    "location": location,
    "owner_id": ownerId,
    "label": ownerId,
    "featured": featured,
    "event_url": eventUrl,
    "share_url": shareUrl,
    "banner_url": bannerUrl,
    "eventname": eventName,
    "thumb_url": thumbUrl,
    "score": score,
    "categories": categories,
    "tags": categories,
    "Venue": venueData?.toJson(),
    "tickets": ticket?.toJson(),
  };
}

class Venue {
  String? street;
  String? city;
  String? state;
  String? country;
  String? longitude;
  String? latitude;
  String? fullAddress;

  Venue({
    this.street,
    this.city,
    this.state,
    this.latitude,
    this.fullAddress,
    this.longitude,
    this.country,

  });

  factory Venue.fromJson(Map<String, dynamic> json) => Venue(
    city: json["city"],
    street: json["street"],
    state: json["state"],
    country: json["country"],
    latitude: json["latitude"].toString(),
    longitude: json["longitude"].toString(),
    fullAddress: json["full_address"],

  );

  Map<String, dynamic> toJson() => {
    "city": city,
    "street": street,
    "state": state,
    "country": country,
    "latitude": latitude,
    "longitude": longitude,
    "full_address": fullAddress,
  };
}

class Ticket {
  bool? hasTickets;
  String? ticketUrl;
  String? ticketCurrency;
  String? minTicketPrice;
  String? maxTicketPrice;

  Ticket({
    this.hasTickets,
    this.ticketUrl,
    this.ticketCurrency,
    this.minTicketPrice,
    this.maxTicketPrice,
  });

  factory Ticket.fromJson(Map<String, dynamic> json) => Ticket(
    hasTickets: json["has_tickets"],
    ticketUrl: json["ticket_url"],
    ticketCurrency: json["ticket_currency"],
    minTicketPrice: json["min_ticket_price"].toString(),
    maxTicketPrice: json["max_ticket_price"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "has_tickets": hasTickets,
    "ticket_url": ticketUrl,
    "ticket_currency": ticketCurrency,
    "min_ticket_price": minTicketPrice,
    "max_ticket_price": maxTicketPrice,
  };


}



