import { getTicketsByDestinationDB } from "../repositories/ticket.repository.js";

export async function getTicketById(req, res) {
  try {
    const { ticket } = req;

    res.send(ticket);
  } catch (err) {
    console.log(err);
    return res.sendStatus(500);
  }
}

export async function getTicketsByDestination(req, res) {
  try {
    const { cityId } = req;

    const tickets = await getTicketsByDestinationDB(cityId);

    if (!tickets.rowCount) return res.sendStatus(404);

    res.send(tickets.rows);
  } catch (err) {
    console.log(err);
    return res.sendStatus(500);
  }
}
