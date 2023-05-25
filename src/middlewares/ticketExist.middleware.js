import { db } from "../config/database.js";

export async function ticketExist(req, res, next) {
  try {
    const { id } = req.params;
    const ticket = await db.query(
      `
      SELECT
        *
      FROM
        tickets
      WHERE
        id = $1
      ;
    `,
      [id]
    );

    if (!ticket.rowCount) return res.sendStatus(404);

    req.ticket = ticket.rows[0];
    next();
  } catch (err) {
    console.log(err);
    res.sendStatus(500);
  }
}
