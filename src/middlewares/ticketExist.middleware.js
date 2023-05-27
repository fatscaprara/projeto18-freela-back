import { getTicketByIdDB } from "../repositories/ticket.repository.js";

export async function ticketExist(req, res, next) {
  try {
    const { id } = req.params;
    const ticket = await getTicketByIdDB(id);

    if (!ticket.rowCount) return res.sendStatus(404);

    req.ticket = ticket.rows[0];
    next();
  } catch (err) {
    console.log(err);
    res.sendStatus(500);
  }
}
